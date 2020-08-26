//
//  ViewController.m
//  curl_quic
//
//  Created by tomxiang on 2020/8/25.
//  Copyright © 2020 tomxiang. All rights reserved.
//

#import "ViewController.h"
#import "curl.h"

CURLcode getUrl(char *url)
{
    CURL *curl;
    CURLcode res = CURLE_OK;
    struct curl_slist *headers = NULL;
    //增加HTTP header
    headers = curl_slist_append(headers, "Accept:application/json");
    headers = curl_slist_append(headers, "Content-Type:application/json");
    headers = curl_slist_append(headers, "charset:utf-8");
    curl = curl_easy_init();    // 初始化
    if (curl)
    {
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);// 改协议头
        curl_easy_setopt(curl, CURLOPT_URL,url);
        res = curl_easy_perform(curl);   // 执行
        NSLog(@"res===%i",res);
        curl_slist_free_all(headers);
        curl_easy_cleanup(curl);
    }
    return res;
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    curl_version_info_data *data=  curl_version_info(CURLVERSION_NOW);
//    printf("\nopenssl version %s\n",data->ssl_version);
    getUrl("http://3954-quic.liveplay.myqcloud.com/live/3954_380440836_1200.flv?bizid=3954&txSecret=d09615d66516");
}


@end
