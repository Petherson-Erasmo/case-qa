Given('I am on home page') do
  visit 'https://www.enjoei.com.br'
end

Given('I choose some maximum product price') do
  find(".c-modal__close").click

  search_div = find(:xpath, "(//h2[contains(text(),'vem que tá barato')]/../../..)")
  div = search_div.find(:css, "div.c-content-widget__items .c-content-widget__items-wrap")
  list_max_price = div.all(".c-content-widget__item")
  index = rand(list_max_price.size)
  @item_max_price = list_max_price[index]

  @price = @item_max_price.text.split(" ").last
end

When('I click in this price category') do
  @item_max_price.click
end

Then('I should only see products no more expensive than the choosen price') do
  catalog = find(:css, ".-md-gutter-large")
  catalog.all("span[data-test='div-preco'] span:nth-child(1)").each do |item|
    product_price = item.text.split(" ").last
    expect(product_price.to_i).to be <= @price.to_i
  end
end