/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the base http method handler used if non defined
 * @datet 2019-09-07
 */
public virtual class BaseHttpMethodHandler implements IHttpMethodHandler {
    
    /**
     * BaseHttpMethodHandler default constructor
     */
    public BaseHttpMethodHandler() {}

    /**
     * Handles a HttpHandler.Request request
     *
     * @param HttpHandler.Request request 
     * @throws NoMethodHandlerException
     * @return HttpHandler.Response
     */
    public virtual HttpHandler.Response handle(HttpHandler.Request request) {

        throw new NoMethodHandlerException();
    }
    
    /**
     * Handles response by calling relavant method based on the request status
     *
     * @param IHttpMethodHandler handler
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public virtual void done(HttpRequest request, HttpResponse response) {

        if ( response.isSuccess() ) {

            this.complete(request, response);
            
        } else {

            this.fail(request, response);
        }
    }

    /**
     * Called when the request is done processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public virtual void complete(HttpRequest request, HttpResponse response) {}

    /**
     * Called when the request failed processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public virtual void fail(HttpRequest request, HttpResponse response) {}
}
