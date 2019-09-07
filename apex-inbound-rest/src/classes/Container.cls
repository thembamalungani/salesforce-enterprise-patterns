/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the container. It is responsible for handling dependacies
 * @date 2019-09-06
 */
public virtual class Container {

    /**
     * @author Themba Malungani <themba.clarence@gmail.com>
     * @description Thrown when no bean is registered
     * @date 2019-09-07
     */
    public class InvalidBeanException {}

    /**
     * These are the bean bindings. The binding takes the form:
     * beanName => instance
     */
    protected static final Map<String, Object> BINDINGS = new Map<String, Object>{
        OrdersCreateHandler.class.getName() => new LeadServiceHandler()
    };

    /**
     * Bind a bean name to an instance
     *
     * @param String name
     * @throws InvalidBeanException
     * @param bean
     */
    public virtual void bind(String name, Object bean) {

        if ( bean instanceof String ) {
            
            Object bean = this.createBean((String)bean);
        }

        this.assertBean(bean, (String)bean);

        BINDINGS.put(name, bean);
    }

    /**
     * Fetches a bean from the bindings by name
     * 
     * @param String name
     * @throws NoBeanException
     * @return
     */
    public virtual Object getBean(String name) {

        Object bean = BINDINGS.get(name.trim());

        this.assertBean(bean, name);

        return bean;
    }

    /**
     * Creates a bean by dyamically creating an instance of the class passed
     *
     * @param String name
     * @return Object
     */
    protected virtual Object createBean(String name) {

        Object bean;

        try {

            bean = Type.forName(name).newInstance();      

        } catch(Exception e) {

            bean = null;
        }

        return bean;
    }

    /**
     * Asserts that the passed bean is not null
     *
     * @param Object bean
     * @param String name
     * @throws Container.InvalidBeanException
     */
    protected void assertBean(Object bean, String name) {

        if ( bean == null ) {

            String message = String.format(StringConstants.INVALID_BEAN_EXCEPTION, new String[]{ name });
            throw new Container.InvalidBeanException(message);
        }
    }
}
