window.util = {
  getURLParameter : function(name){
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
  }  
};





$(document).ready(function(){

  //seting selected item on main menu
  var pathName = window.location.pathname
  var menuItem = $("a[href='"+ pathName+ "']")
  if(menuItem.length > 0) {
    menuItem.parent().addClass('active');
  }

  //Selec marked itens in search form
  if($('.search-companies-form').length > 0) {
    var category_id  =  window.util.getURLParameter("category_id");
    var city_id      =  window.util.getURLParameter("city_id");

    if(category_id != null){
      $('.search-companies-form .category-selection').val(category_id)      
    }

    if(city_id != null){
      $('.search-companies-form .city-selection').val(city_id)      
    }    
    
  }
})

