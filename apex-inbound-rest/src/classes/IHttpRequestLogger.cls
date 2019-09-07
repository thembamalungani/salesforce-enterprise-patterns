/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the contract for logging http requests.
 * @date 2019-09-06
 */
public interface IHttpRequestLogger {
    
    /**
     * handles logging of http request and response
     * 
     * @param HttpHandler.Request request
     * @param HttpHandler.Response response
     * @return 
     */
    void log(HttpHandler.Request request, HttpHandler.Response response);
}
