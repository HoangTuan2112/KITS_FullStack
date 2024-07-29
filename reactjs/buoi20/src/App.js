import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "./pages/home/Home";
import NotFound from "./components/notFound/NotFound";
import Product from "./pages/product/Product";
import Register from "./pages/register/Register";
import ProductDetail from "./pages/productDetail/ProductDetail";
import "./style.css";
import AppProvider from "./AppContext";
import Cart from "./components/cart/Cart";
import { Switch } from "react-router-dom";

function App() {
  return (
    <div>
      {/* <Routes>
        <Route index element={<Home />}></Route>
        <Route path="/product" element={<Product />}></Route>
        <Route path="/detail/:id" element={<ProductDetail />}></Route>
        <Route path="/register" element={<Register />}></Route>
        <Route path="/cart" element={<Cart />}></Route>
        <Route path="/*" element={<NotFound />}></Route>
      </Routes> */}
      <Switch>
        <Route exact path="/" component={Home} />
        <Route path="/product" component={Product} />
        <Route path="/detail/:id" component={ProductDetail} />
        <Route path="/register" component={Register} />
        <Route path="/cart" component={Cart} />
        <Route path="*" component={NotFound} />
      </Switch>
    </div>
  );
}

export default App;
