Given('I am on home page') do
  @home_page.open
end

Given('I choose some maximum product price') do
  @home_page.close_modal

  @item_category = @home_page.get_item_category
  
  @price = @home_page.get_category_price(@item_category)
  log @price
end

When('I click in this price category') do
  @item_category.click
end

Then('I should only see products no more expensive than the choosen price') do
  expect(find(:xpath, "//span[contains(text(),'não encontramos nadinha, mas não fica triste. que')]", visible: false).visible?).to be false

  @search_filter.get_catolog.each do |item|
    product_price = @search_filter.get_product_price(item)
    log product_price
    
    expect(product_price.to_i).to be <= @price.to_i
  end
end