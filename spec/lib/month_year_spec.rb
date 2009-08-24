require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lib::MonthYear do
  it "on initialization should parse the informed date correctly" do
    date = Date.today
    month_year = Lib::MonthYear.new(date)
    month_year.month.should == date.month
    month_year.year.should == date.year
  end

  context "when comparing two diferent instances with the same values" do
    before :each do
      @month_year_a = Lib::MonthYear.new(Date.today)
      @month_year_b = Lib::MonthYear.new(Date.today)
    end

    it "comparing them should equal true" do
      @month_year_a.should == @month_year_b
    end

    it "should have the same hash value" do
      @month_year_a.hash.should == @month_year_b.hash
    end

    it "should return 0 when evaluating <=>" do
      (@month_year_a <=> @month_year_b).should == 0
    end
  end

  context "when comparing two diferent instances with different values" do
    before :each do
      @month_year_previous = Lib::MonthYear.new('2009-08-01'.to_date)
      @month_year          = Lib::MonthYear.new('2009-09-01'.to_date)
      @month_year_later    = Lib::MonthYear.new('2009-10-01'.to_date)
    end

    it "comparing them should not equal true" do
      @month_year.should_not == @month_year_previous
    end

    it "comparing today with a previous date with <=> should return +1" do
      (@month_year <=> @month_year_previous).should == 1
    end

    it "comparing today with a later date with <=> should return -1" do
      (@month_year <=> @month_year_later).should == -1
    end
  end

  it "should return a formated string with month and year" do
    date = "2009-05-01".to_date
    month_year = Lib::MonthYear.new(date)
    month_year.to_s.should == "Maio 2009"
  end
end
