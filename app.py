from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:silpo1@localhost/silpo'
db = SQLAlchemy(app)
shopping_cart = []


class Product(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    price = db.Column(db.Float, nullable=False)
    quantity = db.Column(db.Integer, nullable=False)
    image_url = db.Column(db.String(100), nullable=False)

    def __init__(self, name, price, quantity, image_url):
        self.name = name
        self.price = price
        self.quantity = quantity
        self.image_url = image_url


@app.route('/')
def index():
    products = Product.query.all()
    return render_template('index.html', products=products)


@app.route('/add_to_cart', methods=['POST'])
def add_to_cart():
    product_id = request.form['product_id']
    product = Product.query.get(product_id)
    if product:
        cart_item = next((item for item in shopping_cart if item['id'] == product.id), None)
        if cart_item:
            cart_item['quantity'] += 1
        else:
            shopping_cart.append({'id': product.id, 'name': product.name, 'price': product.price, 'quantity': 1})
    return redirect(url_for('index'))


@app.route('/cart')
def cart():
    total = sum(item['price'] * item['quantity'] for item in shopping_cart)
    total = format(total, '.2f')
    return render_template('cart.html', cart=shopping_cart, total=total)


@app.route('/clear_cart', methods=['POST'])
def clear_cart():
    global shopping_cart
    shopping_cart = []
    return redirect(url_for('cart'))


if __name__ == '__main__':
    app.run()
