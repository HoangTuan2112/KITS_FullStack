import React from 'react'
import { Link } from 'react-router-dom'
import { Button, Card, CardBody, CardSubtitle, CardText, Col,CardTitle } from 'reactstrap'
import { AppContext } from '../../AppContext'
import { useContext } from 'react'

export default function Product(props) {
    const { product } = props
    const {cart,setCart,addToCart,mergeProducts}=useContext(AppContext)
    const products = [
        { id: 1, name: 'Product A', quantity: 2 },
        { id: 2, name: 'Product B', quantity: 1 },
        { id: 1, name: 'Product A', quantity: 3 },
        { id: 3, name: 'Product C', quantity: 5 },
        { id: 2, name: 'Product B', quantity: 4 }
      ];
    return (
        <Col lg={3} md={4} sm={6} xs={6} className='' >


            <Card>
                <CardBody>
                    <CardTitle tag="h5">
                        Card title
                    </CardTitle>
                    <CardSubtitle
                        className="mb-2 text-muted"
                        tag="h6"
                    >
                        Card subtitle
                    </CardSubtitle>
                    <CardText>
                        <h1>product</h1>
                        <p>Info: {product.name}</p>
                        <Link to={`/detail/${product.id}`}>Chi tiết sản phẩm</Link>
                    </CardText>
                    <Button onClick={()=>{
                        if(addToCart({id:product.id, name:product.name,quantity:1})){
                            mergeProducts(cart)
                        }
                     

                    }}>
                        Mua hàng
                    </Button>
                </CardBody>
            </Card>
        </Col>
    )
}
