/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the container. It is responsible for handling dependacies
 * @date 2019-09-06
 */
public virtual class Container {

    /**
     * These are the bean bindings. The binding takes the form:
     * beanName => instance
     */
    protected static final Map<String, Object> BINDINGS = new Map<String, Object>{
        LeadServiceCreateHandler.class.getName() => new LeadServiceHandler()
    };

    /**
     * Bind a bean name to an instance
     *
     * @param String name
     * @throws InvalidBeanException
     * @param bean
     */
    public void bind(String name, Object bean) {

        if ( bean instanceof String ) {
            
            bean bean = this.constructBean((String)bean);

            if ( bean == null ) {

                String message = String.format(StringConstants.INVALID_BEAN_EXCEPTION, new String[]{ bean });
                throw new InvalidBeanException(message);
            }
        }

        BINDINGS.put(name, bean);
    }

    /**
     * Fetches a bean from the bindings by name
     * 
     * @param String name
     * @throws NoBeanException
     * @return
     */
    public Object getBean(String name) {

        Object bean = BINDINGS.get(name.trim());

        if ( bean == null ) {

            bean = this.constructBean(name);

            if ( bean == null ) {

                throw new NoBeanException();
            }
        }

        return bean;
    }

    /**
     * Creates a bean by dyamically creating an instance of the class passed
     *
     * @param String name
     * @return Object
     */
    protected Object constructBean(String name) {

        Object bean;

        try {

            bean = Type.forName(name).newInstance();      

        } catch(Exception e) {

            bean = null;
        }

        return bean;
    }
}
