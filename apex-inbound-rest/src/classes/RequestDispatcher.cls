/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the handler for lead REST API
 * @date 2019-09-06
 */
public class RequestDispatcher implements IRequestDispatcher {
    
    /**
     * HttpHandler default constructor
     */
    public RequestDispatcher() {}

    /**
     * Handles the http request by sdelegating the handling to the instance of HttpRouteHandler
     * passed
     *
     * @param Type type
     * @return HttpResponse
     */
    public HttpResponse dispatch(Type type) {

        HttpRequest request = RequestFactory.getRequestFor(type);
        IHttpMethodHandler handler = HttpMethodHandlerFactory.getHandlerFor(type);
        HttpResponse response = handler.handle(request);

        this.done(handler, request, response);

        return response;
    }

    /**
     * Handles response by calling relavant method based on the request status
     *
     * @param IHttpMethodHandler handler
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public void done(handler, HttpRequest request, HttpResponse response) {

        if ( response.isSuccess() ) {

            handler.complete(request, response);
            
        } else {

            handler.fail(request, response);
        }
    }
}
