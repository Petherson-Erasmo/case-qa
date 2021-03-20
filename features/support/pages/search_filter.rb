class Search_Filter
    include Capybara::DSL

    def get_catolog
        catalog = find(:css, ".-md-gutter-large")
        return catalog.all("span[data-test='div-preco'] span:nth-child(1)")
    end

    def get_product_price(item)
        return item.text.split(" ").last
    end
end