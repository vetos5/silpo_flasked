from flask import Flask, render_template, request, session, redirect, url_for

app = Flask(__name__)
app.secret_key = 'secret_key'


products = [
    {"id": 1, "name": "Revo", "price": 24},
    {"id": 2, "name": "Pivo", "price": 1488},
    {"id": 3, "name": "Elda", "price": 0.01}
]

@app.route('/')
def index():
    return render_template('index.html', products=products)

@app.route('/add_to_cart/<int:product_id>')
def add_to_cart(product_id):
    if 'cart' not in session:
        session['cart'] = []

    # Check if the product is already in the cart
    if product_id not in session['cart']:
        session['cart'].append(product_id)

    return redirect(url_for('index'))


@app.route('/remove_from_cart/<int:product_id>')
def remove_from_cart(product_id):
    if 'cart' in session and product_id in session['cart']:
        session['cart'].remove(product_id)

    return redirect(url_for('cart'))

@app.route('/cart')
def cart():
    cart_products = [product for product in products if product['id'] in session.get('cart', [])]
    total_price = sum(product['price'] for product in cart_products)
    return render_template('cart.html', cart_products=cart_products, total_price=total_price)

if __name__ == '__main__':
    app.run(debug=True)
