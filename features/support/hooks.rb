Before do
    @home_page = Home_Page.new
    @screenshots = Screenshots.new
    @search_filter = Search_Filter.new
end


After do
    @screenshots.full_screenshot
end