include UsersHelper

class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  # Report profits monthly
  def monthly_profits
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    if(@month < 10)
      month_s = "0#{@month}"
    else
      month_s = @month.to_s
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly profits report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{month_s}-#{i_s}")
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end
  
  # Report profits yearly
  def profits
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly profits report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    @months_cats = []
    arr_meses = monthsArr
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    i = 1
    
    while(i <= 12)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{i_s}-01")
      @months_cats.push("'#{arr_meses[i - 1][0]}'")
      
      i += 1
    end
  end
  
  # Report divisions monthly
  def report_view_monthly_divisions
    @company = Company.find(params[:company_id])
    @division = Division.find(params[:division_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly divisions report - #{@division.name} - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{@month}-#{i_s}")
      
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end
  
  # Select division for monthly report
  def report_monthly_divisions
    @company = Company.find(params[:company_id])
    @divisions = @company.get_report_divisions()
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly divisions report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
  end
  
  # Report divisions yearly
  def report_divisions
    @company = Company.find(params[:company_id])
    @divisions = @company.get_report_divisions()
    @divisions_cats = []
    
    for division in @divisions
      @divisions_cats.push("'#{division.name}'")
    end
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly divisions report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
  end
  
  # Report locations monthly
  def report_view_monthly_locations
    @company = Company.find(params[:company_id])
    @location = Location.find(params[:location_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly locations report - #{@location.name} - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{@month}-#{i_s}")
      
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end
  
  # Chose location for monthly report
  def report_monthly_locations
    @company = Company.find(params[:company_id])
    @locations = @company.get_report_locations()
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly locations report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
  end

  # Report locations yearly
  def report_locations
    @company = Company.find(params[:company_id])
    @locations = @company.get_report_locations()
    @locations_cats = []
    
    for location in @locations
      @locations_cats.push("'#{location.name}'")
    end
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly locations report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
  end

  # Report customers monthly
  def report_view_monthly_customers
    @company = Company.find(params[:company_id])
    @customer = Customer.find(params[:customer_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly customers report - #{@customer.name} - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{@month}-#{i_s}")
      
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end

  # Show customers list for monthly customer report
  def report_monthly_customers
    @company = Company.find(params[:company_id])
    @customers = @company.get_customers()
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly customers report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
  end
  
  # Report customers yearly
  def report_customers
    @company = Company.find(params[:company_id])
    @customers = @company.get_customers()
    @customers_cats = []
    
    for customer in @customers
      @customers_cats.push("'#{customer.name}'")
    end
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly customers report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
  end

  # Report products monthly
  def report_view_monthly_products
    @company = Company.find(params[:company_id])
    @product = Product.find(params[:product_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly product report - #{@product.full_name} - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{@month}-#{i_s}")
      
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end
  
  # Select product for monthly report
  def report_monthly_products
    @company = Company.find(params[:company_id])
    @products = @company.get_products()
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly products report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
  end
  
  # Report products yearly
  def report_products
    @company = Company.find(params[:company_id])
    @products = @company.get_products()
    @products_cats = []
    
    for product in @products
      @products_cats.push("'#{product.name}'")
    end
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly products report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
  end
  
  # Report sellers monthly
  def report_view_monthly_sellers
    @company = Company.find(params[:company_id])
    @user = User.find(params[:user_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly sellers report - #{@user.username} - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{@month}-#{i_s}")
      
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end
  
  # Select seller for monthly report
  def report_monthly_sellers
    @company = Company.find(params[:company_id])
    @users = @company.get_users()
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly sellers report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
  end
  
  # Report sellers yearly
  def report_sellers
    @company = Company.find(params[:company_id])
    @users = @company.get_users()
    @users_cats = []
    
    for user in @users
      @users_cats.push("'#{user.username}'")
    end
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly sellers report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
  end
  
  # Report sales monthly
  def report_monthly_sales
    
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    if(@month < 10)
      month_s = "0#{@month}"
    else
      month_s = @month.to_s
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly sales report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{month_s}-#{i_s}")
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end
  
  # Report sales yearly
  def report_sales
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly sales report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    @months_cats = []
    arr_meses = monthsArr
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    i = 1
    
    while(i <= 12)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{i_s}-01")
      @months_cats.push("'#{arr_meses[i - 1][0]}'")
      
      i += 1
    end
  end

  def reports_guias
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly sales report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    @months_cats = []
    arr_meses = monthsArr
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    i = 1
    
    while(i <= 12)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{i_s}-01")
      @months_cats.push("'#{arr_meses[i - 1][0]}'")
      
      i += 1
    end
  end

  def rpt_serviceorder_all
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    if(@month < 10)
      month_s = "0#{@month}"
    else
      month_s = @month.to_s
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly sales report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{month_s}-#{i_s}")
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end

  def rpt_purchases_all
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    if(@month < 10)
      month_s = "0#{@month}"
    else
      month_s = @month.to_s
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Ventas por mes  - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{month_s}-#{i_s}")
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end

  def reports_ccobrar
    @company = Company.find(params[:company_id])
    @pagetitle = "Facturas "    
  end

  def rpt_ccobrar2_pdf
    @company = Company.find(params[:company_id])
    @pagetitle = "Facturas "    
  end

  def rpt_ccobrar3_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Facturas "    
    @customers = @company.get_customers()

  end
  def rpt_ccobrar4_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Liquidacion Cobranzas "    
    @customers = @company.get_customers()

  end
  
  def rpt_ccobrar5_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Liquidacion Cobranzas "    
    @customers = @company.get_customers()
    @monedas=@company.get_monedas
  end
  def rpt_ccobrar6_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Liquidacion Cobranzas "    
    @customers = @company.get_customers()
  end
  def rpt_ccobrar7_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Liquidacion Cobranzas "    
    @customers = @company.get_customers()
  end
  
  def rpt_cpagar2_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Pendientes por cobrar general"    
    @customers = @company.get_customers()
  end
  def rpt_cpagar3_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Pendientes por cobrar por proveedor"    
    @suppliers = @company.get_suppliers()

  end
  def rpt_cpagar4_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Liquidacion de pagos"    
    @customers = @company.get_customers()
  end
  def rpt_cpagar5_pdf
    @company = Company.find(params[:company_id])    
    @pagetitle = "Cuentas x pagar por vencimiento"    
    @customers = @company.get_customers()
  end
  
  
  def reports_cventas
    @company = Company.find(params[:company_id])  
    @pagetitle = "Facturas "    
  end
  def rpt_facturas_all2
    @company = Company.find(params[:company_id])
    @pagetitle = "Facturas por Cliente"    
    @customers = @company.get_customers()

  end 

  def rpt_facturas_all
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    if(params[:month] and params[:month].numeric?)
      @month = params[:month].to_i
    else
      @month = Time.now.month
    end
    
    if(@month < 10)
      month_s = "0#{@month}"
    else
      month_s = @month.to_s
    end
    
    curr_year = Time.now.year
    c_year = curr_year
    c_month = 1
    
    @years = []
    @months = monthsArr
    @month_name = @months[@month - 1][0]
    
    @pagetitle = "Monthly sales report - #{@month_name} #{@year} - #{@company.name}"
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    last_day_of_month = last_day_of_month(@year, @month)
    @date_cats = []
    
    i = 1
    
    while(i <= last_day_of_month)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{month_s}-#{i_s}")
      @date_cats.push("'" + doDate(Time.parse("#{@year}-#{@month}-#{i_s}"), 5) + "'")
      
      i += 1
    end
  end



  def reports_compras
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly sales report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    @months_cats = []
    arr_meses = monthsArr
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    i = 1
    
    while(i <= 12)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{i_s}-01")
      @months_cats.push("'#{arr_meses[i - 1][0]}'")
      
      i += 1
    end
  end

  def reports_cpagar
    @company = Company.find(params[:company_id])
    
    if(params[:year] and params[:year].numeric?)
      @year = params[:year].to_i
    else
      @year = Time.now.year
    end
    
    @pagetitle = "Yearly sales report - #{@year} - #{@company.name}"
    
    curr_year = Time.now.year
    c_year = curr_year
    
    @years = []
    @months_cats = []
    arr_meses = monthsArr
    
    while(c_year > Time.now.year - 5)
      @years.push(c_year)
      c_year -= 1
    end
    
    @dates = []
    
    i = 1
    
    while(i <= 12)
      if(i < 10)
        i_s = "0#{i}"
      else
        i_s = i.to_s
      end
      
      @dates.push("#{@year}-#{i_s}-01")
      @months_cats.push("'#{arr_meses[i - 1][0]}'")
      
      i += 1
    end
  end
 

  # Reports
  def reports
    @company = Company.find(params[:company_id])
  end

  def rpt_cpagar1_all
    @company = Company.find(params[:company_id])    
    @pagetitle = "Liquidacion Cobranzas "    
    @customers = @company.get_customers()
    @monedas=@company.get_monedas
    
  end


  def rpt_guias_2
    @company = Company.find(params[:company_id])    
    @pagetitle = "Liquidacion Cobranzas "    
    @customers = @company.get_customers()

  end

  def rpt_guias_3
    @company = Company.find(params[:company_id])    
    @pagetitle = "Liquidacion Cobranzas "    
    @customers = @company.get_customers()
  end

  def rpt_guias_4
    @company = Company.find(params[:company_id])    
    @pagetitle = "Guias "    
    @customers = @company.get_customers()
  end
  
  def rpt_ost_1
    @company = Company.find(params[:company_id])
    @pagetitle = "Orden Servicio de Transporte"    
  end
    
  def rpt_purchaseorder_all
    @company = Company.find(params[:company_id])
    @pagetitle = "Ordenes de compra"    
  end

end
