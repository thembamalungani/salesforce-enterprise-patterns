/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the factory used to create requests based on handlers
 * @date 2019-09-07
 */
public class RequestFactory {

    /**
     * Prepares a request
     *
     * @param Type type
     * @return HttpHandler.Request
     */
    public static HttpHandler.Request getRequestFor(Type type) {

        HttpRequest request = HttpRequestt.fromContext(RestContext.request);
        IRequestTranslator translator = RequestTranslatorFactory.getTranslatorForHandler(type.getName());
    
        return translator.translate(request);
    }
}
