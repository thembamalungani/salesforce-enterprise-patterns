/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the base request translator used when no custom one is defined
 * @date 2019-09-07
 */
public virtual class BaseRequestTranslator implements IRequestTranslator {

    /**
     * BaseRequestTranslator default constructor
     */
    public BaseRequestTranslator() {}

    /**
     * Translates a requests
     *
     * @param HttpRequest request
     * @return HttpRequest
     */
    public virtual HttpRequest translate(HttpRequest request) {
        
        return null;
    }
}
