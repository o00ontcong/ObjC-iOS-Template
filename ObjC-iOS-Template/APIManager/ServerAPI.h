//
//  ServerAPI.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 10/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//


#ifdef DEV
#define URL_HOST @"http://125.234.14.228/"
#elif QA
#define URL_HOST @"http://125.234.14.228/"
#elif PROD
#define URL_HOST @"http://125.234.14.228/"
#endif /* ServerAPI_h */

#define URL_TOKEN @"token"
//Login
#define PATH_LOGIN @"submitloginapi_aa"
#define PROJECT_SESSIONKEY @"PROJECT_SESSIONKEY"
#define AUTHENTICATION_CHANGE @"AUTHENTICATIONCHANGE"
