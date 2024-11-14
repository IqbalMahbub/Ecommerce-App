import 'package:ecommerceapp/presentation/screens/payment_web_view_screen.dart';
import 'package:ecommerceapp/presentation/state_holders/payment_controller.dart';
import 'package:ecommerceapp/presentation/widgets/centered_circular_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CreateInvoiceController>().createInvoice();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: GetBuilder<CreateInvoiceController>(
          builder: (createInvoiceController) {
            if (createInvoiceController.inProgress) {
              return const CenterdCircularProgressIndicator();
            }
            final invoiceWrapper =
                createInvoiceController.paymentMethodListModel.data!.first;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Payable: ${invoiceWrapper.payable}'),
                    Text('VAT: ${invoiceWrapper.vat}'),
                    Text('Total: ${invoiceWrapper.total}'),
                    ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: invoiceWrapper.paymentMethodList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Get.to(() => PaymentWebViewScreen(
                                url: invoiceWrapper.paymentMethodList![index]
                                    .redirectGatewayURL!));
                          },
                          leading: Image.network(
                              invoiceWrapper.paymentMethodList![index].logo ??
                                  ''),
                          title: Text(
                              invoiceWrapper.paymentMethodList![index].name ??
                                  ''),
                          trailing: const Icon(Icons.arrow_forward_outlined),
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}