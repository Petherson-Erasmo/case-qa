class Home_Page
    include Capybara::DSL
    def open
        visit "https://www.enjoei.com.br"
    end

    def close_modal
        find(".c-modal__close").click
    end

    def get_item_category
        search_div = find(:xpath, "(//h2[contains(text(),'vem que tá barato')]/../../..)")
        div = search_div.find(:css, "div.c-content-widget__items .c-content-widget__items-wrap")
        list_max_price = div.all(".c-content-widget__item")
        index = rand(list_max_price.size)
        return list_max_price[index]
    end

    def get_category_price(item_category)
        return item_category.text.split(" ").last
    end
end