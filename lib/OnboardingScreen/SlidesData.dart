import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  

  SliderModel({this.imageAssetPath});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  
  String getImageAssetPath(){
    return imageAssetPath;
  }

  

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  
  sliderModel.setImageAssetPath("assets/onboarding/tour11.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  
  sliderModel.setImageAssetPath("assets/onboarding/tour22.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  
  sliderModel.setImageAssetPath("assets/onboarding/tour33.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/onboarding/tour44.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}