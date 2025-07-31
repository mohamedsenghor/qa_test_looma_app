from pymongo import MongoClient
from bson.objectid import ObjectId

def connect_to_mongodb(uri, db_name):
    """Connect to MongoDB using the provided URI and database name.
    
    Args:
        uri (str): MongoDB connection URI
        db_name (str): Database name
    
    Returns:
        None
    """
    client = MongoClient(uri)
    db = client[db_name]
    return db

def create_product(db, product):
    """Create a new product in the database.
    
    Args:
        db: The MongoDB database object
        product (dict): Product data containing title, price, etc.
    
    Returns:
        str: The ID of the created product
    """
    required_fields = ['title', 'price']
    if not all(field in product for field in required_fields):
        return None
    
    if not isinstance(product['price'], (int, float)) or product['price'] <= 0:
        return None
    
    result = db.products.insert_one(product)
    return str(result.inserted_id)

def read_product(db, product_id):
    """Read a product from the database by its ID.
    
    Args:
        db: The MongoDB database object
        product_id (str): The product ID to read
    
    Returns:
        dict: Product data or None if not found
    """
    try:
        obj_id = ObjectId(product_id)
    except:
        return None
    
    return db.products.find_one({"_id": obj_id})

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