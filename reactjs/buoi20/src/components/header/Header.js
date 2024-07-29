import {useState,React,useContext}from "react";
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
} from "reactstrap";
import { AppContext } from "../../AppContext";
import { Link } from "react-router-dom";
import "./header.css";
export default function Header() {
  const [collapsed, setCollapsed] = useState(true);

  const toggleNavbar = () => setCollapsed(!collapsed);
  const {cart}=useContext(AppContext)
  return (
    <div>
      <Navbar color="faded" light expand="md">
        <NavbarBrand href="/" className="me-auto">
          reactstrap
        </NavbarBrand>
        <NavbarToggler onClick={toggleNavbar} className="me-2" />
        <Collapse isOpen={!collapsed} navbar>
          <Nav navbar>
            <Link to="/">Home</Link>
            <Link to="/product">Product</Link>
            <Link to="/register">Register</Link>
            
           <Link to="/cart">Cart: {cart.length}</Link>
          </Nav>
        </Collapse>
      </Navbar>
    </div>
  );
}
