import Footer from "./component/footer/Footer";
import { Header } from "./component/header/Header";
import { Main1, Main2 } from "./component/main/Main";
import { Hook } from "./hook/Hook";
import { Hook2 } from "./hook/Hook2";

function App(){
    const name = 'Tuan';
    const age= 20;
    return (
        <div>
            {/* <Header/>
            <Main1/>
            <Main2/>
            <Footer name1={name} age1={age}/>   */}
            <Hook/>
            <Hook2/>
        </div>
    )
}
export default App;