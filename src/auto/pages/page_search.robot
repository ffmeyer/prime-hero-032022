*** Settings ***
Documentation        Aqui estarão presentes todos os elementos mapeados da tela do Produto.

*** Variables ***
&{PRODUTO_PAGE}
...           img_blouse=//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
...           title_search=Search - My Store
...           mouse_over_dress=//*[@id="block_top_menu"]/ul/li[2]
...           mouse_over_summer_dress=//a[@title="Summer Dresses"]/../../../ul[@style="display: block;"]
...           category_name=//span[@class="cat-name"] [contains(text(),'Summer Dresses')]
...           expected_count=There are 3 products.
...           product_count=//span[@class="heading-counter"] [contains(text(),"There are 3 products.")]
