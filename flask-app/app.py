# import the Flask framework
from flask import Flask, jsonify, current_app, request, make_response
import json
from flaskext.mysql import MySQL

# create a flask object
app = Flask(__name__)

# add db config variables to the app object
app.config['MYSQL_DATABASE_HOST'] = 'db'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'webapp'
app.config['MYSQL_DATABASE_PASSWORD'] = 'abc123'
app.config['MYSQL_DATABASE_DB'] = 'housing_finder'

# create the MySQL object and connect it to the 
# Flask app object
db_connection = MySQL()
db_connection.init_app(app)

# import the blueprint objects from their respective locations
from customer_api.customers import customers_blueprint
from manager_api.managers import managers_blueprint

# register the blueprints we created with the current Flask app object.
app.register_blueprint(customers_blueprint, url_prefix='/cust')
app.register_blueprint(managers_blueprint, url_prefix='/mgr')

# --------------------------------------------------------------------
# Create a function named hello world that 
# returns a simple html string 
# the @app.route("/") connects the hello_world function to 
# the URL / 
@app.route("/")
def hello_world():
    return f'<h1>Hello From the Flask-MySQL Connection Tutorial</h1>'

@app.route('/pref')
def pref():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Roommate_Pref')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@app.route('/price')
def price():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Price_Code')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@app.route('/tenant')
def tenants():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Tenant')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data) 

@app.route('/buildingTenant')
def buildingTen():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Building_Tenant')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@app.route('/building')
def buildings():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Building')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@app.route('/landlord')
def landlords():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Landlord')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@app.route('/student')
def student():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Student')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@app.route('/studentAdd', methods = ['POST'])
def add_student():
   current_app.logger.info(request.form)
   cursor = db_connection.get_db().cursor()
   stu_id = request.form['stu_id'] 
   first_name = request.form['first_name'] 
   last_name = request.form['last_name'] 
   year_in_school = request.form['year_in_school']
   age = request.form['age']
   price_id = request.form['price_id']
   pref_id = request.form['pref_id']
   query = f'insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, pref_id) values (\"{stu_id}\", \"{first_name}\", \"{last_name}\", \"{year_in_school}\", \"{age}\", \"{price_id}\", \"{pref_id}\")'
   cursor.execute(query)
   db_connection.get_db().commit()
   return "Success!"

@app.route('/buildingAdd', methods = ['POST'])
def add_building():
   current_app.logger.info(request.form)
   cursor = db_connection.get_db().cursor()
   building_id = request.form['building_id'] 
   building_type_id = request.form['building_type_id'] 
   building_address = request.form['building_address'] 
   building_name = request.form['building_name']
   minimum_age = request.form['minimum_age']
   monthly_rent = request.form['monthly_rent']
   available_bedspaces = request.form['available_bedspaces']
   price_id = request.form['price_id']
   landlord_id = request.form['landlord_id']
   query = f'insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent, available_bedspaces, price_id, landlord_id) values (\"{building_id}\", \"{building_type_id}\", \"{building_address}\", \"{building_name}\", \"{minimum_age}\", \"{monthly_rent}\", \"{available_bedspaces}\", \"{price_id}\", \"{landlord_id}\")'
   cursor.execute(query)
   db_connection.get_db().commit()
   return "Success!"

@app.route('/unitAdd', methods = ['POST'])
def add_unit():
   current_app.logger.info(request.form)
   cursor = db_connection.get_db().cursor()
   unit_id = request.form['unit_id'] 
   bathrooms = request.form['bathrooms'] 
   bedrooms = request.form['bedrooms'] 
   wifi_included = request.form['wifi_included']
   building_id = request.form['building_id']
   query = f'insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (\"{unit_id}\", \"{bathrooms}\", \"{bedrooms}\", \"{wifi_included}\", \"{building_id}\")'
   cursor.execute(query)
   db_connection.get_db().commit()
   return "Success!"

# If this file is being run directly, then run the application 
# via the app object. 
# debug = True will provide helpful debugging information and 
#   allow hot reloading of the source code as you make edits and 
#   save the files. 
if __name__ == '__main__': 
    app.run(debug = True, host = '0.0.0.0', port = 4000)
