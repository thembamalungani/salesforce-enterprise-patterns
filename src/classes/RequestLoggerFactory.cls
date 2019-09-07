/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This factory used to create request logger
 * @date 2019-09-06
 */
public class RequestLoggerFactory {

    /**
     * Gets a logger for the handler, if none defined, a default one is returned
     *
     * @param Type type
     * @return IRequestLogger
     */
    public static IRequestLogger getLoggerFor(Type type) {
        
        IRequestLogger logger;

        try {

            String loggerName = type.getName().replace('Handler', 'Logger');
            logger = (IRequestLogger) RestContainer.getBean(loggerName);

        } catch (Exception e) {

            logger = (IRequestLogger) RestContainer.getBean(BaseRequestLogger.class.getName());
        }

        return logger;
    }
}
