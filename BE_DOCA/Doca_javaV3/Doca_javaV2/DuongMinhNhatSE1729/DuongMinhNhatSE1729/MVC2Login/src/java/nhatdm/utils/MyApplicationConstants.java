/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.utils;

/**
 *
 * @author Admin
 */
public class MyApplicationConstants {

    public class DispatcherFeature {

        public static final String LOGIN_PAGE = "";
        public static final String LOGIN_CONTROLLER = "loginController";
        public static final String SEARCH_LASTNAME_CONTROLLER = "searchController";
        public static final String DELETE_ACCOUNT_CONTROLLER = "deleteLastNameController";
        public static final String UPDATE_ACCOUNT_CONTROLLER = "updateController";
        public static final String LOGOUT_CONTROLLER = "logOutController";
        public static final String ADD_ITEM_TO_CART_CONTROLLER = "addItemToCartController";
        public static final String SEARCH_ITEM_CONTROLLER = "searchBookController";
        public static final String VIEW_CART_PAGE = "viewCart";
        public static final String REMOVE_ITEM_FROM_CART_CONTROLLER = "removeItemFromCartController";
        public static final String CREATE_ACCOUNT_CONTROLLER = "createAccountController";
        public static final String CHECKOUT_CONTROLLER = "checkOutBillController";

    }

    public class LoginFeatures {

        public static final String SEARCH_PAGE = "searchJspPage";
        public static final String INVALID_PAGE = "invalidPage";
    }

    public class UpdateFeatures {

        public static final String ERROR_PAGE = "errorPage";
    }

    public class SearchLastNameFeature {

        public static final String SEARCH_PAGE = "searchHTMLPage";
        public static final String RESULT_PAGE = "searchJspPage";
    }

    public class DeleteAccountFeature {

        public static final String ERROR_PAGE = "errorPage";
    }

    public class LogoutFeature {

        public static final String LOGIN_PAGE = "";
    }

    public class CreateAccountFeature {

        public static final String ERROR_PAGE = "errorCreateAccountPage";
        public static final String LOGIN_PAGE = "";
    }

    public class AddItemToCartFeature {

    }

    public class RemoveItemFeature {

    }

    public class CheckOutFeature {

        public static final String CHECKOUT_PAGE = "checkOutJspPage";
        public static final String ERROR_PAGE = "errorPage";
    }

    public class SearchBookFeature {

        public static final String BookStoreHTML_PAGE = "bookStoreHtmlPage";
        public static final String BookStoreJSP_PAGE = "bookStoreJspPage";
    }

}
