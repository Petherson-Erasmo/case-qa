class Screenshots
    include Capybara::DSL
  
    def full_screenshot
      width  = Capybara.page.execute_script("return Math.max(document.body.scrollWidth, document.body.offsetWidth, document.documentElement.clientWidth, document.documentElement.scrollWidth, document.documentElement.offsetWidth);")
      height = Capybara.page.execute_script("return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);")
  
      page.current_window.resize_to(width+100, height+100)
  
      page.save_screenshot("logs/temp_screenshot.png")
    end
   end