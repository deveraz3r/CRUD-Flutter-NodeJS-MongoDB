import 'package:crud_mongodb_frontend/resources/components/reusable_text_feild.dart';
import 'package:crud_mongodb_frontend/view_model/employees_view_model.dart';
import './../utils/app_urls.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final EmployeesViewModel _employeesViewModel = Get.put(EmployeesViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Home Screen",
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){_employeesViewModel.fetchAllEmployees();}, icon: Icon(Icons.refresh, color: Colors.white,))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReusableTextFeild(
            prefixIcon: Icon(Icons.search),
            hintText: "Search employee"
          ),
          Expanded(
            child: Obx(() {
              switch (_employeesViewModel.employeesList.value.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.COMPLETED:
                  return ListView.builder(
                      itemCount: _employeesViewModel.employeesList.value.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _employeesViewModel.employeesList.value.data![index].name.toString(),
                            style: const TextStyle(),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: (){
                                  _employeesViewModel.deleteEmployee(context, _employeesViewModel.employeesList.value.data![index].sId.toString());
                                },
                                icon: const Icon(Icons.delete, color: Colors.red,)
                              ),
                              IconButton(
                                onPressed: (){
                                  Get.toNamed(AppEndPoints.updateEmployee);
                                },
                                icon: const Icon(Icons.edit)
                              ),
                            ],
                          )
                        );
                      }
                  );
                default:
                  return Center(
                    child: Text(
                      _employeesViewModel.employeesList.value.message.toString(),
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  );
              }
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(AppEndPoints.createEmployee);
        },
        child: Icon(Icons.add, color: AppColors.primaryColor,),
      ),
    );
  }
}
