from flask import Flask, render_template, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:silpo1@localhost/silpo'
db = SQLAlchemy(app)


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


##with app.app_context():
  ##  product = Product(name='Sweet potato', price=13.90, quantity=30, image_url='https://images.silpo.ua/products/1600x1600/2b45e359-dde6-4719-b6fa-4f58ba0807d4.png')
    ##db.session.add(product)
    ##db.session.commit()


@app.route('/')
def index():
    products = Product.query.all()
    return render_template('index.html', products=products)

if __name__ == '__main__':
    app.run()

