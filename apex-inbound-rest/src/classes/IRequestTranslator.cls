/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the contract for translators
 * @date 2019-09-07
 */
public interface IRequestTranslator {

    /**
     * Translates the request
     *
     * @param HttpHandler.Request request
     * @return HttpHandler.Request
     */
    HttpHandler.Request translate(HttpHandler.Request request);
}
