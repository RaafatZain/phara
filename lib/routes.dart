import 'package:get/get.dart';
import 'package:pharma_man/view/screens/add_debt.dart';
import 'package:pharma_man/view/screens/add_employee.dart';
import 'package:pharma_man/view/screens/all_employee.dart';
import 'package:pharma_man/view/screens/all_suppliers.dart';
import 'package:pharma_man/view/screens/auth/check_code.dart';
import 'package:pharma_man/view/screens/auth/forget_password.dart';
import 'package:pharma_man/view/screens/auth/login.dart';
import 'package:pharma_man/view/screens/auth/signup.dart';
import 'package:pharma_man/view/screens/edit_purchase.dart';
import 'package:pharma_man/view/screens/edit_supplier.dart';
import 'package:pharma_man/view/screens/get_invoice.dart';
import 'package:pharma_man/view/screens/home.dart';
import 'package:pharma_man/view/screens/main.dart';
import 'package:pharma_man/view/screens/post_supplier.dart';
import 'package:pharma_man/view/screens/purchase.dart';
import 'package:pharma_man/view/screens/add_purchase.dart';
import 'package:pharma_man/view/screens/main_sale.dart';
import 'package:pharma_man/view/screens/sales.dart';


List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page:() => Login(),),
    GetPage(name: '/signup', page:() => SignUp()),
    GetPage(name: '/home', page:() => HomePage()),
    GetPage(name: '/forgetpass', page:() => ForgetPass()),
    GetPage(name: '/checkcode', page:() => CheckCode()),
    GetPage(name: '/mainscreen', page: () => MainScreen()),
    GetPage(name: '/purchasesscreen', page: ()=> PurchasesScreen()),
    GetPage(name: '/slaesscreen', page: ()=> SalesScreen() ),
    GetPage(name: '/postsuppliers', page: ()=> PostSuppliersScreen() ),
    GetPage(name: '/addpurchase', page:() => AddPurchase()),
    GetPage(name: '/mainsale', page:() => MainSale()),
    GetPage(name: '/adddebt', page:() => AddDebt()),
    GetPage(name: '/allsuppliers', page:() => AllSuppliers()),
    GetPage(name: '/editsupplier', page:() => EditSupplier()),
    GetPage(name: '/getInvoice', page:() => GetInvoiceScreen()),
    GetPage(name: '/allemployees', page:() => AllEmployees()),
    GetPage(name: '/addEmploye', page:() => AddEmploye()),
    GetPage(name: '/editPurchase', page:() => EditPurchase()),
];
