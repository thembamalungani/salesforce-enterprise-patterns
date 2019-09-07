/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the rest handler
 * @date 2019-09-06
 */
@RestResource(UrlMapping = '/v1/orders/*')
global with sharing class OrdersEndpoint_v1 {

    /**
     * Handles POST request to the leads endpoint
     * 
     * @return HttpResponse
     */
    @HttpPost
    global static HttpResponse create() {

        return RequestDispatcher.dispatch(OrdersCreateHandler.class);
    }
}