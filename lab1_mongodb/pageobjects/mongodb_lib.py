from pymongo import MongoClient
from bson.objectid import ObjectId

def connect_to_mongodb(uri, db_name):
    """Connect to MongoDB using the provided URI and database name.
    
    Args:
        uri (str): MongoDB connection URI
        db_name (str): Database name
    
    Returns:
        The MongoDB database object
    """
    client = MongoClient(uri)
    db = client[db_name]
    return db

def create_product(db, product):
    required_fields = ['title', 'price']
    if not all(field in product for field in required_fields):
        return ''   # <-- changer None en ''

    if not isinstance(product['price'], (int, float)) or product['price'] <= 0:
        return ''   # <-- changer None en ''

    result = db.products.insert_one(product)
    return str(result.inserted_id)

def read_product(db, product_id):
    try:
        obj_id = ObjectId(product_id)
    except:
        return ''   # <-- changer None en ''

    result = db.products.find_one({"_id": obj_id})
    return result if result else {}  # <-- retourner dict vide au lieu de None


def update_product(db, product_id, update_fields):
    """Update a product in the database.
    
    Args:
        db: The MongoDB database object
        product_id (str): The product ID to update
        update_fields (dict): Fields to update
    
    Returns:
        int: Number of modified documents
    """
    try:
        obj_id = ObjectId(product_id)
    except:
        return 0
    
    if 'price' in update_fields and (not isinstance(update_fields['price'], (int, float)) or update_fields['price'] <= 0):
        return 0
    
    result = db.products.update_one({"_id": obj_id}, {"$set": update_fields})
    return result.modified_count



def delete_product(db, product_id):
    """Delete a product from the database.
    
    Args:
        db: The MongoDB database object
        product_id (str): The product ID to delete
    
    Returns:
        int: Number of deleted documents
    """
    try:
        obj_id = ObjectId(product_id)
    except:
        return 0
    
    result = db.products.delete_one({"_id": obj_id})
    return result.deleted_count

def create_user(db, user):
    """Create a new user in the database.
    
    Args:
        db: The MongoDB database object
        user (dict): User data containing email, username, etc.
    
    Returns:
        str: The ID of the created user or empty string if failed
    """
    required_fields = ['email', 'username', 'password']
    if not all(field in user for field in required_fields):
        return ''
    
    if not isinstance(user['email'], str) or '@' not in user['email']:
        return ''
    
    result = db.users.insert_one(user)
    return str(result.inserted_id)

def read_user(db, user_id):
    try:
        obj_id = ObjectId(user_id)
    except:
        return None

    result = db.users.find_one({"_id": obj_id})
    return result if result else None  # ✅ retour à None


def update_user(db, user_id, update_fields):
    """Update a user in the database.
    
    Args:
        db: The MongoDB database object
        user_id (str): The user ID to update
        update_fields (dict): Fields to update
    
    Returns:
        int: Number of modified documents
    """
    try:
        obj_id = ObjectId(user_id)
    except:
        return 0
    
    result = db.users.update_one({"_id": obj_id}, {"$set": update_fields})
    return result.modified_count

def delete_user(db, user_id):
    """Delete a user from the database.
    
    Args:
        db: The MongoDB database object
        user_id (str): The user ID to delete
    
    Returns:
        int: Number of deleted documents
    """
    try:
        obj_id = ObjectId(user_id)
    except:
        return 0
    
    result = db.users.delete_one({"_id": obj_id})
    return result.deleted_count

from bson.objectid import ObjectId

def create_order(db, order):
    required_fields = ['userId', 'date', 'products']
    if not all(field in order for field in required_fields):
        return ''

    try:
        # Conversion de userId si nécessaire
        if isinstance(order['userId'], str):
            order['userId'] = ObjectId(order['userId'])

        # Conversion de chaque productId
        for product in order['products']:
            pid = product.get('productId')
            if isinstance(pid, str):
                product['productId'] = ObjectId(pid)
            elif not isinstance(pid, ObjectId):
                return ''
    except:
        return ''

    result = db.orders.insert_one(order)
    return str(result.inserted_id)






def read_order(db, order_id):
    try:
        obj_id = ObjectId(order_id)
    except:
        return ''

    result = db.orders.find_one({"_id": obj_id})
    return result if result else ''  


def update_order(db, order_id, update_fields):
    try:
        obj_id = ObjectId(order_id)
    except:
        return 0

    if 'products' in update_fields:
        for product in update_fields['products']:
            if not isinstance(product.get('productId'), ObjectId):
                return 0

    result = db.orders.update_one({"_id": obj_id}, {"$set": update_fields})
    return result.modified_count

def delete_order(db, order_id):
    """Delete an order from the database.
    
    Args:
        db: The MongoDB database object
        order_id (str): The order ID to delete
    
    Returns:
        int: Number of deleted documents
    """
    try:
        obj_id = ObjectId(order_id)
    except:
        return 0
    
    result = db.orders.delete_one({"_id": obj_id})
    return result.deleted_count

def create_category(db, category):
    """Create a new category in the database.
    
    Args:
        db: The MongoDB database object
        category (dict): Category data containing name, description, image
    
    Returns:
        str: The ID of the created category or empty string if failed
    """
    required_fields = ['name', 'description']
    if not all(field in category for field in required_fields):
        return ''
    
    # Check if category with same name exists
    existing = db.categories.find_one({"name": category['name']})
    if existing:
        return ''
    
    result = db.categories.insert_one(category)
    return str(result.inserted_id)

def read_category(db, category_id):
    try:
        obj_id = ObjectId(category_id)
    except:
        return ''

    result = db.categories.find_one({"_id": obj_id})
    return result if result else ''  


def update_category(db, category_id, update_fields):
    """Update a category in the database.
    
    Args:
        db: The MongoDB database object
        category_id (str): The category ID to update
        update_fields (dict): Fields to update
    
    Returns:
        int: Number of modified documents
    """
    try:
        obj_id = ObjectId(category_id)
    except:
        return 0
    
    result = db.categories.update_one({"_id": obj_id}, {"$set": update_fields})
    return result.modified_count

def delete_category(db, category_id):
    """Delete a category from the database.
    
    Args:
        db: The MongoDB database object
        category_id (str): The category ID to delete
    
    Returns:
        int: Number of deleted documents
    """
    try:
        obj_id = ObjectId(category_id)
    except:
        return 0
    
    result = db.categories.delete_one({"_id": obj_id})
    return result.deleted_count