class EntryReport < Entry
  def self.generate(params)
    query_params = {:joins => {:project, :contract}, :order => :date}
    query_params.deep_merge! EntryReport.group_by(params[:group_by])
    query_params.deep_merge! EntryReport.between(params[:period][:from], params[:period][:to])
    query_params.deep_merge! EntryReport.filter_contracts(params[:contracts].keys)
    query_params.deep_merge! EntryReport.filter_projects(params[:projects].keys)
    query_params.deep_merge! EntryReport.filter_users(params[:users].keys)

    EntryReport.process_period(query_params, params[:period][:scale])
  end

  def self.group_by(param)
    result = case param
      when "contract" : group_by_contract
      when "project"  : group_by_project
      when "user"     : group_by_user
      else
        raise "Parametro inválido"
    end
    result[:select] = "date, #{result[:select]}, sum(hours) as hours"
    result[:group] = "date, #{result[:group]}"
    result
  end
  def self.group_by_contract
    {:select => 'contract_id as id', :group => 'project_id',
      :description => lambda{|id| Contract.find(id).name }
    }
  end
  def self.group_by_project
    {:select => 'project_id as id', :group => 'project_id',
      :description => lambda{|id| Project.find(id).name }
    }
  end
  def self.group_by_user
    {:select => 'user_id as id', :group => 'user_id',
      :description => lambda{|id| User.find(id).name }
    }
  end

  def self.between(from, to)
    {:conditions => {:date => (from.to_date..to.to_date)} }
  end

  def self.filter_contracts(contracts)
    {:conditions => {:projects => {:contract_id => contracts}}}
  end
  def self.filter_projects(projects)
    {:conditions => {:project_id => projects}}
  end
  def self.filter_users(users)
    {:conditions => {:user_id => users}}
  end

  def self.process_period(query_params, param)
    load_name = query_params[:description]
    query_params.delete(:description)
    result = EntryReport.all(query_params).reduce(ActiveSupport::OrderedHash.new) do |result, item|
      result[item.id] ||= ActiveSupport::OrderedHash.new
      reference = period_reference(param, item)
      result[item.id][reference] ||= 0
      result[item.id][reference] += item.hours
      result
    end
    result = add_names(result, load_name)
    calculate_total(result)
  end

  def self.period_reference(param, data)
    case param
      when 'week'  : (data.date.monday..data.date.sunday)
      when 'month' : MonthYear.new(data.date)
      when 'day'   : data.date.to_date
      else
        raise "Parametro inválido"
    end
  end

  def self.add_names(data, load_name)
    data.reduce(ActiveSupport::OrderedHash.new) do |result, array_value|
      result[load_name.call(array_value.first)] = array_value.last
      result
    end
  end
  def self.calculate_total(data)
    column_total = ActiveSupport::OrderedHash.new
    global_total = 0
    data.each do |row_key, row|
      row_total = 0.0
      row.each do |column_key, column|
        column_total[column_key] ||= 0
        row_total += column
        column_total[column_key] += column
      end
      row["Total"] = row_total
      global_total += row_total
    end
    column_total['Total'] = global_total
    data['Total'] = column_total
    data
  end
end

class MonthYear
  attr_accessor :month, :year

  def initialize(date)
    self.month = date.month
    self.year = date.year
  end

  def equal?(other)
    (self <=> other) == 0
  end
  alias eql? equal?
  alias == equal?
  alias === equal?

  def <=>(other)
    result = self.year - other.year
    result == 0 ? self.month - other.month : result
  end

  def to_s
    "#{I18n.t('date.month_names')[self.month]} #{self.year}"
  end
  def hash
    "#{self.year}#{'%02d' % self.month}".to_i
  end
  alias to_param hash
end
