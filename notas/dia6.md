En cualquier momento, mientras procesamos unas plantillas de helm:
    EXISTE UN CONTEXTO.
        Un diccionario en memoria:  
        contexto: 
            clave1: valor1
            clave2: 
                clave21:  <<<<<<<<<<<<<<<< with .clave1.clave12
                    clave211: valor211
                    clave211: valor212***
                clave22: valor21
    
    Cuando recupero un valor, le indico a HELM la ruta del valor
    .clave2.clave21.clave211
    $.clave2.clave21.clave211
    
    with .clave1.clave12
        .clave211
        $.clave2.clave21.clave211
        