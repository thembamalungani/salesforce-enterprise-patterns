/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the base context setter used when no custom one is defined
 * @date 2019-09-07
 */
public class BaseResponseContextSetter implements IResponseContextSetter {

    /**
     * BaseResponseContextSetter default constructor
     */
    public BaseResponseContextSetter() {}

    /**
     * Sets the RestContext.response
     *
     * @param HttpResponse response
     */
    void virtual setContext(HttpResponse response) {}
}
