//
//  ServerAPI.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 10/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//


#ifdef DEV
#define URL_HOST @"http://125.234.14.228"
#elif STAGING
#define URL_HOST @"http://125.234.14.228"
#elif PRODUCT
#define URL_HOST @"http://125.234.14.228"
#endif /* ServerAPI_h */

#define URL_TOKEN @"token"
//Login
#define PATH_LOGIN @"/submitloginapi"
#define PATH_OVERVIEW_REPORT @"/service/so_overview_report"
#define PROJECT_SESSIONKEY @"PROJECT_SESSIONKEY"
#define AUTHENTICATION_CHANGE @"AUTHENTICATIONCHANGE"
#define PATH_ORDER_LIST @"/service/orderlist"
#define PATH_PRODUCT_LIST @"/service/listproduct"
