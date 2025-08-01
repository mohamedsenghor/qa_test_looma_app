*** Settings ***
Library    BuiltIn
Library     Collections
Library    ../pageobjects/mongodb_lib.py


*** Variables ***
${MONGO_URI}      mongodb+srv://bassinediallo20:Passer%40123@cluster0.ifptzd7.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
${DB_NAME}        fakestore

*** Test Cases ***
# User Tests
Create User - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=john@gmail.com
    ...    username=johnd
    ...    password=hashedpassword
    ...    name=Create Dictionary firstname=John lastname=Doe
    ...    address=Create Dictionary city=kilcoole street="7835 new road" zipcode="12926-3874" geolocation=Create Dictionary lat="-37.3159" long="81.1496"
    ...    phone="1-570-236-7033"
    ${id}=    Create User    ${db}    ${user}
    Should Not Be Empty    ${id}

Create User - Invalid Email
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=invalid_email
    ...    username=invaliduser
    ...    password=invalidpass
    ${id}=    Create User    ${db}    ${user}
    Should Be Empty    ${id}



Create User - Missing Password
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=jane@gmail.com
    ...    username=jane
    # pas de password ici volontairement
    ${id}=    Create User    ${db}    ${user}
    Should Be Empty    ${id}





Read User - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=john@gmail.com
    ...    username=johnd
    ...    password=hashedpassword
    ${id}=    Create User    ${db}    ${user}
    ${result}=    Read User    ${db}    ${id}
    Should Not Be Empty    ${result}
    Dictionary Should Contain Key    ${result}    email
    Dictionary Should Contain Item    ${result}    email    john@gmail.com

Read User - Not Found
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read User    ${db}    ObjectId("000000000000000000000000")
    Should Be Equal    ${result}    ${NONE}



Read User - Invalid ID
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read User    ${db}    invalidObjectId123
    Should Be Equal    ${result}    ${NONE}



Update User - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=john@gmail.com
    ...    username=johnd
    ...    password=hashedpassword
    ${id}=    Create User    ${db}    ${user}
    ${update}=    Create Dictionary
    ...    address=Create Dictionary city="new city" street="new street"
    ${count}=    Update User    ${db}    ${id}    ${update}
    Should Be True    ${count} > 0

Update User - Invalid ID
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${update}=    Create Dictionary
    ...    address=Create Dictionary city="new city" street="new street"
    ${count}=    Update User    ${db}    ObjectId("000000000000000000000000")    ${update}
    Should Be Equal As Integers    ${count}    0


Update User - Invalid Email Format
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=john@gmail.com
    ...    username=johnd
    ...    password=hashedpassword
    ${id}=    Create User    ${db}    ${user}
    ${update}=    Create Dictionary
    ...    email=invalidemail@@
    ${count}=    Update User    ${db}    ${id}    ${update}
    



Delete User - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=john@gmail.com
    ...    username=johnd
    ...    password=hashedpassword
    ${id}=    Create User    ${db}    ${user}
    ${count}=    Delete User    ${db}    ${id}
    Should Be Equal As Integers    ${count}    1

Delete User - Not Found
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${count}=    Delete User    ${db}    ObjectId("000000000000000000000000")
    Should Be Equal As Integers    ${count}    0



Delete User - Invalid ID Format
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${count}=    Delete User    ${db}    invalidObjectId456
    Should Be Equal As Integers    ${count}    0



# Order Tests
Create Order - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}

    # Création utilisateur
    ${user}=    Create Dictionary
    ...    email=order_user@gmail.com
    ...    username=orderuser
    ...    password=securepass
    ${user_id}=    Create User    ${db}    ${user}
    

    # Création produit
    ${product}=    Create Dictionary
    ...    title=Ordinateur
    ...    price=1500
    ${product_id}=    Create Product    ${db}    ${product}
    

    # Création d'une liste de produits
    ${product1}=    Create Dictionary
    ...    productId=${product_id}
    ...    quantity=4
    ${products}=    Create List    ${product1}

    # Création commande
    ${order}=    Create Dictionary
    ...    userId=${user_id}
    ...    date=2020-03-02T00:00:00.000Z
    ...    products=${products}
    



Create Order - Invalid Product ID
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=invalid_product_user@gmail.com
    ...    username=invalidproduct
    ...    password=securepass
    ${user_id}=    Create User    ${db}    ${user}
    
    ${product1}=    Create Dictionary
    ...    productId=ObjectId("000000000000000000000000")
    ...    quantity=4
    ${products}=    Create List    ${product1}
    
    ${order}=    Create Dictionary
    ...    userId=ObjectId(${user_id})
    ...    date=2020-03-02T00:00:00.000Z
    ...    products=${products}
    
    # Convertir l'ObjectId en chaîne pour la création
    ${user_id_str}=    Convert To String    ${user_id}
    Set To Dictionary    ${order}    userId=ObjectId(${user_id_str})
    
    ${id}=    Create Order    ${db}    ${order}
   



Create Order - Empty Products List
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=order_user2@gmail.com
    ...    username=orderuser2
    ...    password=securepass
    ${user_id}=    Create User    ${db}    ${user}

    ${products}=    Create List

    ${order}=    Create Dictionary
    ...    userId=${user_id}
    ...    date=2020-03-02T00:00:00.000Z
    ...    products=${products}

    ${id}=    Create Order    ${db}    ${order}
    



Read Order - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read Order    ${db}    68877645969b079fe92152fc
    Should Not Be Equal    ${result}    ''
    Dictionary Should Contain Key    ${result}    userId
    Dictionary Should Contain Key    ${result}    date
    Dictionary Should Contain Key    ${result}    products


Read Order - Invalid ID
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read Order    ${db}    invalidOrderId123




Read Order - Invalid ID
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Run Keyword And Ignore Error    Read Order    ${db}    invalidOrderId123
    



Update Order - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}

    ${user}=    Create Dictionary
    ...    email=update_order_user@gmail.com
    ...    username=updateorder
    ...    password=securepass
    ${user_id}=    Create User    ${db}    ${user}

    ${product}=    Create Dictionary
    ...    title=Old Product
    ${product_id}=    Create Product    ${db}    ${product}

    ${product1}=    Create Dictionary
    ...    productId=ObjectId(${product_id})
    ...    quantity=3

    ${products}=    Create List    ${product1}

    ${order}=    Create Dictionary
    ...    userId=ObjectId(${user_id})
    ...    date=2020-03-02T00:00:00.000Z
    ...    products=${products}

    ${order_id}=    Create Order    ${db}    ${order}
    Should Not Be Equal    ${order_id}    ''

    Log    ${order_id}
    ${order_before}=    Read Order    ${db}    ${order_id}
    Log    ${order_before}

    ${update_fields}=    Create Dictionary
    ...    date=2020-04-01T00:00:00.000Z
    ${count}=    Update Order    ${db}    ${order_id}    ${update_fields}
    


Update Order - Invalid Date Format
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=update_order2@gmail.com
    ...    username=updateorder2
    ...    password=securepass
    ${user_id}=    Create User    ${db}    ${user}

    ${product}=    Create Dictionary
    ...    title=Old Product 2
    ${product_id}=    Create Product    ${db}    ${product}

    ${product1}=    Create Dictionary
    ...    productId=ObjectId(${product_id})
    ...    quantity=3

    ${products}=    Create List    ${product1}

    ${order}=    Create Dictionary
    ...    userId=ObjectId(${user_id})
    ...    date=2020-03-02T00:00:00.000Z
    ...    products=${products}

    ${order_id}=    Create Order    ${db}    ${order}
    Should Not Be Equal    ${order_id}    ''

    ${update_fields}=    Create Dictionary
    ...    date=invalid-date-format
    ${count}=    Update Order    ${db}    ${order_id}    ${update_fields}
    Should Be Equal As Integers    ${count}    0


Update Order - Nonexistent ID
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${update_fields}=    Create Dictionary
    ...    date=2020-04-01T00:00:00.000Z
    ${count}=    Update Order    ${db}    ObjectId("000000000000000000000000")    ${update_fields}
    Should Be Equal As Integers    ${count}    0



Delete Order - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read Order    ${db}    ObjectId("687e26aaa25119ef908d9831")
    Should Not Be Equal    ${result}    ''
    
    ${count}=    Delete Order    ${db}    ObjectId("687e26aaa25119ef908d9831")

    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${count}=    Delete Order    ${db}    ObjectId("000000000000000000000000")
    Should Be Equal As Integers    ${count}    0



Delete Order - Invalid ID Format
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${count}=    Delete Order    ${db}    invalidOrderId456
    Should Be Equal As Integers    ${count}    0


Delete Order - Already Deleted
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${user}=    Create Dictionary
    ...    email=to_delete@gmail.com
    ...    username=to_delete
    ...    password=pass
    ${user_id}=    Create User    ${db}    ${user}

    ${product}=    Create Dictionary
    ...    title=Delete Me
    ...    price=99
    ${product_id}=    Create Product    ${db}    ${product}

    ${product1}=    Create Dictionary
    ...    productId=${product_id}
    ...    quantity=1
    ${products}=    Create List    ${product1}

    ${order}=    Create Dictionary
    ...    userId=${user_id}
    ...    date=2024-01-01T00:00:00.000Z
    ...    products=${products}

    ${order_id}=    Create Order    ${db}    ${order}
    ${count1}=    Delete Order    ${db}    ${order_id}
    ${count2}=    Delete Order    ${db}    ${order_id}
    Should Be Equal As Integers    ${count2}    0


# Category Tests

Create Category - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}

    ${category}=    Create Dictionary
    ...    name="men's clothing"
    ...    description="Articles destinés aux hommes"
    ...    image="URL d'une image représentative"

    ${id}=    Create Category    ${db}    ${category}




Create Category - Duplicate Name
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}

    ${category}=    Create Dictionary
    ...    name=men's clothing
    ...    description=Articles destinés aux hommes

    ${id1}=    Create Category    ${db}    ${category}
    Should Not Be Equal    ${id1}    ''

    ${id2}=    Create Category    ${db}    ${category}
   

Create Category - Missing Name
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${category}=    Create Dictionary
    ...    description=Articles sans nom
    ...    image="url_placeholder"
    ${id}=    Create Category    ${db}    ${category}
    Should Be Empty    ${id}





Read Category - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}

    ${category}=    Create Dictionary
    ...    name=men's clothing
    ...    description=Articles destinés aux hommes

    ${id}=    Create Category    ${db}    ${category}
    Log    ID inséré: ${id}

    ${result}=    Read Category    ${db}    ${id}
    Log    Résultat de lecture: ${result}

   


Read Category - Not Found
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read Category    ${db}    ObjectId("000000000000000000000000")
    

Read Category - Invalid ID
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read Category    ${db}    invalidCategoryId123
    



Update Category - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${category}=    Create Dictionary
    ...    name="men's clothing"
    ...    description="Articles destinés aux hommes"
    ${id}=    Create Category    ${db}    ${category}
   
    ${result}=    Read Category    ${db}    ${id}
    
   
    ${update_fields}=    Create Dictionary
    ...    description="Articles masculins"
    ${count}=    Update Category    ${db}    ${id}    ${update_fields}
    

Update Category - Invalid ID
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${update}=    Create Dictionary
    ...    description="Nouvelle description"
    ${count}=    Update Category    ${db}    ObjectId("000000000000000000000000")    ${update}
    



Update Category - Empty Name
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${category}=    Create Dictionary
    ...    name="men's clothing"
    ...    description="Articles destinés aux hommes"
    ${id}=    Create Category    ${db}    ${category}

    ${update_fields}=    Create Dictionary
    ...    name=
    ${count}=    Update Category    ${db}    ${id}    ${update_fields}
    Should Be Equal As Integers    ${count}    0



Delete Category - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read Category    ${db}    ObjectId("687e26aaa25119ef908d9831")
    
    
    ${count}=    Delete Category    ${db}    ObjectId("687e26aaa25119ef908d9831")
    

Delete Category - Not Found
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${count}=    Delete Category    ${db}    ObjectId("000000000000000000000000")
  

Delete Category - Invalid ID Format
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${count}=    Delete Category    ${db}    invalidCategoryId456
    Should Be Equal As Integers    ${count}    0
