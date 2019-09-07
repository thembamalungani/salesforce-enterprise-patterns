/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the factory used to create translators
 * @date 2019-09-07
 */
public class RequestTranslatorFactory {

    /**
     * Gets a translator for the handler, if none defined a default one is returned
     *
     * @param Type type
     * @return IRequestTranslator
     */
    public static IRequestTranslator getTranslatorFor(Type type) {
        
        IRequestTranslator translator;

        try {

            String translatorName = type.getName().replace('Handler', 'Translator');
            translator = (IRequestTranslator) RestContainer.getBean(translatorName);

        } catch (Exception e) {
            
            translator = (IRequestTranslator) RestContainer.getBean(BaseRequestTranslator.class.getName());
        }

        return translator;
    }
}
