/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for handling inbound http methods
 * @date 2019-09-06
 */
public interface IHttpMethodHandler {
    
    /**
     * Handles a HttpHandler.Request request
     *
     * @param HttpHandler.Request request 
     * @return HttpHandler.Response
     */
    HttpResponse handle(HttpRequest request);

    /**
     * Called when the request is done processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    void done(HttpRequest request, HttpResponse response);

    /**
     * Called when the request failed processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    void fail(HttpRequest request, HttpResponse response);
}
