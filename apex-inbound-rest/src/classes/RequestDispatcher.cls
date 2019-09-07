/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the handler for lead REST API
 * @date 2019-09-06
 */
public virtual class RequestDispatcher implements IRequestDispatcher {
    
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

        handler.done(request, response);

        return response;
    }
}
