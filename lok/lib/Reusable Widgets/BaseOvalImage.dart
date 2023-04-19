import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/userSave.dart';
import 'package:lok/constants/models/user.dart';
import 'package:lok/constants/services/lokApiManager.dart';

class BaseOvalImg extends StatefulWidget {
  final double width;
  final double height;
  final double borderWidth;
  const BaseOvalImg({Key? key,required this.width, required this.height,required this.borderWidth,}) : super(key: key);

  @override
  State<BaseOvalImg> createState() => _BaseOvalImgState();
}

class _BaseOvalImgState extends State<BaseOvalImg> {
  List<User> userInfo = MoviesApiService().userInfo;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    var dio = Dio();
    var response = await dio.get(
      '${MoviesApiService().dio.options.baseUrl}/user/getuser/${userId}',
      options: Options(
          headers: {
            'Authorization' : 'Bearer $accesstoken',
          }
      ),
    );
    print(response.statusCode);
    final decoded = response.data['user'] as Map<String, dynamic>;
    final user = User.fromJson(decoded);
    setState(() {
      userInfo.add(user);
    });
    firstName = user.firstName;
    lastName = user.lastname;
    phone = user.normalizedUserName;
    email = user.email;
    photo = user.photo;
  }
  @override
  Widget build(BuildContext context) {
    return _buildGridView();
  }

  Widget _buildGridView() {
    if(userInfo.isEmpty){
      return Center(child: CircularProgressIndicator());
    } else{
      return FutureBulderAppBar(user: userInfo.first, width: widget.width,height: widget.height, borderWidth: widget.borderWidth,);
    }
  }
}

class FutureBulderAppBar extends StatelessWidget {
  const FutureBulderAppBar({Key? key, required this.user, required this.width, required this.height, required this.borderWidth}) : super(key: key);
  final User user;
  final double width;
  final double height;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        String b64 ='iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAYAAAA5ZDbSAAARSklEQVR4nO2de5BU1Z3HP6d7BobHMCDvp7yFlQAyAxKja/FQMDGiSWB9IGXCalkuIVprmZiUldXdVEjWWNl1XcxapBLiZoEYUOK6WSOOLAoCMwMMjs6AgAjyHmQYHjNMT//2j9Mjcx/dfbv73tvdzP1UnRq499x7z9zv/M77/n7QAZA1hKWaXrKGcLbL4jcq2wXIBCmngJ6MIMo1COOAsQjXoCgBioESoBtQ1O6yJuA80AA0IjSgqAP2oKgjRC1nOKBmEPH79/GCvBJYaujOBW4CZgAzUEwEOnnwqBZgN1CO8DbNbFI30ujBczwn5wWWSsYj3A3MAqYBhVkoRgRhO4oNCKvVVD7IQhnSIicFlmp60cJ8hEXAV7JdHhs+BFYS5bdqGseyXZhE5JTAUsUsWvkeirmkaqlhdEtbFLsyHEuhWAoDrUA0llpjqQXdKjdDGq1uBHgTxfOqlD+nfLUPZF1gERRV3I7wI+B6RxcVAN3R3aiuaFELXChMBC32RaAxlpyLXoniJ0zhNaWIulAaV8iawCKEqGABiieBiQkzK7SYPbgsql+0id0Q+ylJr6hB8VP2sUotoNXj0iUlKwLLNiaj+HcUX06YsQjoBfTBm75yqkSAM0A9cC5p7p2EeERNYYvXxUqErwLLDnoS4Z9QPAxxJh1CQG+gL9DFx8KlykXgVCzFr5CjKF6imR+qGzjtV9Ha45vAUslChGeB/rYZwmhL7U92BkLpEgGOAychQYV8EsUTqpTf+FWsNjwXWN6lmCJeBO61zRAG+sWSGx2lbNEKnECLHV/oV4C/VWU0+FQqbwWWKv6KKGuAa20zlADDyI321S1agM/Q7bQ9B1HcrUp534/ieCawbGcRiuXY9Xk7A0PRAl+pNAKH0G21lRbgKUr5uVIO+uUZ4LrAsoYwI1kOPGibYQAwyIsn5yACHAWOEW949VvgQVVGi1dFcPU1y14608DLwLcsJwuA4VzZVhuPRuAA2MqoeIuLfMOrxQzXBJYautPEOoTZlpPFwAjyq3fsNhG0yGdtz24DvqbKOOX2Y10RWLYxgBB/BiZZTnakKtkJR9DVtpWPiHCrms5hNx+X8WuXCkqAd4DJlpNDiDfq7djUAwexa5c/JsKNajrH3XpUKJOLZTNdgD9hFlehq+RAXHt6AyOxe/ujKWC91NDdrUelLbCUU0BnVgE3We44Grgqs4Jd8fREvyfrhO00LvKKVLjTY0lLYBEU3fkPhDsMJxQwCr3qE5CcYrTIVhXmAL8RybwJTc+Cq/geim9bjo8gEDdVuqOra6uU91LJE5nePuW/ENnGVEK8i3mCcSh6PjkgPeqBTyxHI8AMVca76d42JYFlBz1ppQptq5cZiB4KBWTGUfQwyshh4Lp0x8iOq2gRFBFWYBa3GC1wQOYMRHe+jAxBsVIkvebU+UUVPITiG4ZjhcRrPwLS5Wqsq2vCbVSyJJ3bOZJGKugD1KJHcJcZi7bgAHc5D9RhnghppIDxajKfpXIrpxb8C8ziDiIQ1yu6AYMtR4tp4Rep3iqpBUsFNwL/Z8jbBRjv5OqAjKhFW3N7hK+qqfyP01sktGAppwB4AbOUQy1HArxgGNb3rPgXKTd8TJeQxFV0dxZj3rPcm6Bq9ouu6I2IRsZQzENObxHXDmM7M2rRk2maAvTuqnzeHJdvtAI1mDcLHKaE0WoMzckuj2/BI7iP9uKCXtsNxPWXMHbzDEM4yyInl9sKLEIIZZoHLUBvRg/wnz5Yd8MIP4j1kRJib8GVfBPzVtf+cXMHeI3Cbm19JD24O9ml8SRbavhfGF+t9/x52LgRVq+G6mpo8WzPYR7RF2vzKDya7DJLJ0sqGAXsNZzzaTEhEoFnnoFly4yijhgBy5fDnDnelyERTU3w8svw3ntw+DCMHw+33gq33+5TAewWI6JMUNOocXwPqeBpqUAMqRkR8TZFo8httyEQP/3ud96XI17avRuZMMG+XHfcgdTX+1COS4hUmrSpYJlzcQUlFewz3KDOnxf40kuJxQWkRw/k4EH/xW1oQIYOTVy2O+/0qTx7LQIfTuQeytgG7+Am9PrQZYwz0J6xfHnyPGfPwrp13pfFzNNPw6FDifO8+iq89poPhbHudRvMCGbEy24UOGrqlYWwW590nUgEPvzQWd53097bkD5/+YuzfG+95W05AK2H2V5D3BMvu7kXbfwqwe5mHhCJQNShV4uwz77qolGoq3OWd8cOb8sC2Bud3dck7bLrPNsYCowxnPXpO6KiIpiY2EvHF5SVeVsWM6EQDHS4Y2XUKG/L8gVWXYbFRj8WQu3+NdNy1rXt18lZ5GDirbgY5s/3vixmvpzYk8gXTJ/ubTm+wG6xRzHLLmv7KtrYUBfh64fZS5bALbckzvPss3D11f6Upz0//jF0TeLZZ/x4+LZ1I7E3FGDnv8S2oxVfYJ+XBJWC9ev1yyw0zbv26wdr18JDjhfJ3GXcOPjVr3RTYsfgwXoCJN55TzDrI8wUm43yCkCq6EuUE4YzI9EujLLAyZO6w/LppzBpkk6dcsDNQ10dPPUUbN2qZ7LGjYOZM/XsWy+/39UZYJ/pWJRhahqGAZ0WWG/L2WTIPAHtaiHAlpYWa03jK5fQ/nDbE2K2msIG4yEA4RpDRsWV5RjFA7IqLmh9zIPcqEnHdlmMJzoT7LnKB6xtfhyBQ6YTfnYWAtLH2oSOMx9oq6KNExyBwPmBVacx5gNtVbRxCjvb7UuAM6z9JMtSRJvAxq96O1xskjzFqlN381g4FFtLNM6LBALnB9YNV2GqjZ4FQ4y0mXEONtflB3aG2Gyc4woRsZmUDCw4P7AzxEKzwMrGWWgwBs4P7ARuoZsxi7Lxh+qp/9MA17DbJFFo/B4xRKGNE8ysh5IIcISdwC1GPUOcsQkvkTNBYQISYmeInU0Cx4IwNiW9MCD3sBpilIlcaH+grZk2OrkNBM4PrDqdM3uQbxP4c0O24Fug/MCqkyV0T5vAew1Hm8zZAnISq057zQfaBDbu/A0Ezg/MOiksO7hDtieaCcbC+YBZ4KhTgQW95ycgd7mEXS+61nxACxy2njB2tgNyDrt4TIo95kMhADWJE2AKBpGXEes7EFZ9TlKK5RvIy9PVivIkNwjIJaz6lNtFUWu/HmEUuAlXxsMNDc6/HOyonD0LralMLkWwNqHC23ZZQ+0ybLCczcCKGxvh5puhZ08YPRq2ZDVMcm5y6BDMng0lJTB8eAqfn9rpUmAvsAGpYK/BPcCB9F0NPPec0cVB587IihX+u1/I1fTqq8hVVxnf0dy5Dq//xOLGIa7/AeOSsTJZ8eekvbLUZBqjNTfD4sWwdKn+4Luj0tys38Fdd8Fp08Si+Z3ZEsU8sQwQ17eA2YXDKgc3c8TixfYfRD//vHaHVB8/vu4Vy7ZtMG2afgdi6g516aI/bEtKA3aLDP/lqACivezsN5j/nvSrofp6ZNYse680/fsja9dmv6r0I50/j3z/+0g4bP8uxo9Hdu1yeD+rl53PEnnZsYpcwT+66SerpQX57nfjux+6/36ffExlKa1bhwwbFv/3f/BB5MIFh/drwc5P1j87FhdAtjLWIvBnmf+iK1bojpbdLzlwoO50ZFsMN9N77yE33hhf2J49kVWrUrzvUYu4IpU49G5itOIthpvsRCSS+S+9ZQsyalT8X3rmTGTbtuyLk0mqqUHmzUvsNG3+fOTo0RTv3YrILovAO1MWF0C2c4/lLyXVAsVJFy7o9igUiv8CZs9GqquzL1YqadMmLVy8dhaQQYOQP/4xzWcct4grUmkTXtCRwGsISwV1hpvtiv0VufRCNm5MbM0FBch99yGbN2dfvHipqQn5/e+RsrLEFltUhDz+OHL2bJrPiiJSbRH4U6nJ4DN92c53LH8xx919QefOIY89hnTqlPgFTZ6MvPgi0tiYfVFbW5F33tGdo169Epc7HEYeeMAF/5onLOKKVPBI2uICSAWFUsEBS1vc4v5L279fW2uiapuYM9IFC7TX2VOn/BP13DnkjTeQRx9N7pQUEKWQr39de6jN+PkR7Nreo7Hg3ElJ+JGKVPJ3CP9mONgHHX7NA6qr4ckn4Y03kucNh7XjsTlzoLQUpkyBAQPcKceRI7B7N2zfDhs2wObNcMnBBojOnWHhQnjsMbj22uT5HXEITP6PAP5elfGck8sTC1xDJy6yEx0G6zLjwPgFjLu8/z688AL84Q96as8pAwdqoUePhv799f/79dNJmX7TSAROnIDjx+HoUf2zthZ27YJTKcb57NcPHn4YHnlEP9c1LgIfYd4+tY9GJqgZznbOJY98VsVfE+UdshD57MwZWLMGfvlL+Ogjb5+VKl26aE/v998Pc+d65HXHLvIZ3K7K+G+nt3AanPI/gXsNBwejw+z4QDSqYzisXw+vvw4ff+zPc8306aMdn82bp1M3D2sxToBljUhYq6byzVRu40zg9+lPAbW0d2Sr0NFHfXRY2kZtrRb6zTehstK6KuMWJSXau+3s2dqP5nXXae+znnMBbb1iOhrmWnWdTZzwBDiuZGU7S1A8bzjYCV1VZzlY1iefQFWVTh98AMeO6Y7SiRPJ2/CuXXXnbMAAGDJEuzX+0pf0z+HD/Sm/gVZ0u2st9+OqzIPoo22IoKhkHTDPcKIEc3y0nKK+Xm8bsqNfP+iehRooIfuxW6ItZz+3qAWpfzWWUjdJttKbMDvQ8UcvM4ggzLsbHMe8txXgKIVMju18TZmUWhR1PfXAfMzb4o8AKQ4tAkycxk7cKMKidMWFNPzpqDK2Ilj3HnxK2rs/OjyNEKfr9A9qavztOE5IayQba49fxjx0CqGd6eVau5bLnAf2YLf37RVK+RulMvO3kFanP7bB+gHgfw0nosDHYOMUIsCO8+j3ZZWwnBIWZiouZDgXJTV05yIbgGmGEyFgBL7EXMpbGtA9ZquEO4lws5pu8rqQJhlPNsZ61pswz1crdF87iDls5TS6zbV+orufKF9R0zjm1qMynpdR11NPlDmYP10UdMfLHC2zo3MMOICduPsQbnFTXHBxuUA2cxWd+RPCDZaTxegquyO7KW4FDhJvpLGbEHPVFPfNwdX1INlFN1pYA3zVcrIQGI7ZcXHH4Dzaau2nTcuJcKdbba4Z1xf8pIJChF+jWGj7tIHoVaiO4A9T0LNTR7CrkgHWUMIiNSaO9C7gyWuOjZOXAj/Hzi95EboDdiVb8wV0H8S6ngsQQfgJZTzjxlAoEZ7akVRRFvveyT5sYwkwjCsrhE8EHYo9/uTiYeAeVYYvgXI9ryhlBz1p5dfAXbYZwugquy/57ae6FTiJ7iXHX/N5nVYeiM3p+4IvLWGsyl4M/Ay7GNagxe0XS1leX06JVrS1nkBbrz2fAz+ilBft3Cx4ia9dHamgD7AM+E7cZ4fQ1tyH3A7v04xeQTtJIosVYCWFPJHJilAmZKUvK5WUAssRpibMWAT0RoudC1bdig4KeRqz+1Y76hCWZLoalClZG6zIGsKMZCHwA2widhlQ6B53CXrSxE/LbkIv551Fzx8nr2D3IizjHCtjrpqzStZHoyKEqOJbCD8EJjm6qBAtdDHQFR3izY0OWiu66r3IZVGdexr6APgp+1mdztYar8i6wG2IoKjiawhLgVmkOk9eiLbstsjloVgKx5JCW18regWn7ecltJU2k477xiiwEfhXSnnN7w6UE3JG4PZIFYOIMh9YBEzJdnlsqEVYDaxUU9mf7cIkIicFbo9sYzIh7gZmA5PJzmg5CuwCNhBitZpCRRbKkBY5L3B7pJpeXOJmYGYsjcebOG2CttK3CfE2ETb6OTnhJnklsBkpp4gejEW4BmEsujc+CkVf9M6wtmTmHHqW+Bx6JLsPqEWxB0UdTexRN9j6c8078lpgp0g1vbhAJ7pySU0M9n4GBAQEBOQE/w8b9w1y79/LQgAAAABJRU5ErkJggg==';

        Uint8List a(b){
          Uint8List bytesImage = const Base64Decoder().convert(b);
          return bytesImage;
        }

        Uint8List test() {
          if(photo == null){
            return a(b64);
          } else {
            return a(user.photo);
          }
        }

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            border: Border.all(width: borderWidth,color: AdditionalRed),
            color: Colors.redAccent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.memory(test(),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
