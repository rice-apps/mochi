import React, { FunctionComponent } from 'react';
import { StyleSheet, View, Text, Pressable} from 'react-native';
// import { globalStyles } from '../global';
// import { Button } from './Button'
import { mockData } from '../mockData'

import { Dimensions, TouchableHighlight} from 'react-native';


export function Button(props) {
  const { onPress, title = 'Learn More' } = props;
  return (
    <Pressable style={styles.button} onPress={onPress}>
      <Text style={styles.text}>{title}</Text>
    </Pressable>
  );
}


export default function EventCard(prop) {
  return (
    <View style = {styles.card}>
      <View style = {styles.leftTextBox}> 
      {/* the parent for flexbox */}
          {/* the children */}
          <Text style = {styles.date}>
              {mockData.date}
          </Text>

          <Text style = {styles.name}>
              {mockData.name}
          </Text>

          {/*circles*/}
          <View style = {styles.circles}> 
          {/* style={{...styles.icon, color: iconColor, fontSize: iconSize }} */}
          <TouchableHighlight style = {styles.circle}
              underlayColor = '#ccc'
              onPress = { () => alert('Yaay!') }
              >
              <Text> emoji </Text>
          </TouchableHighlight>

          <TouchableHighlight style = {{...styles.circle, backgroundColor:'#D8D8D8'}}
              underlayColor = '#ccc'
              onPress = { () => alert('Yaay!') }
              >
              <Text> emoji </Text>
          </TouchableHighlight>

          <TouchableHighlight style = {styles.circle}
              underlayColor = '#ccc'
              onPress = { () => alert('Yaay!') }
              >
              <Text> emoji </Text>
          </TouchableHighlight>

          <TouchableHighlight style = {{...styles.circle, backgroundColor:'#D8D8D8'}}
              underlayColor = '#ccc'
              onPress = { () => alert('Yaay!') }
              >
              <Text> emoji </Text>
          </TouchableHighlight>

          <TouchableHighlight style = {styles.circle}
              underlayColor = '#ccc'
              onPress = { () => alert('Yaay!') }
              >
              <Text> {mockData.numSignUps} + </Text>
          </TouchableHighlight>
          </View>
          
      
      </View>
      <View style = {styles.buttonBox}> 
        <Button></Button>
      </View>
    </View>
  )
}
const styles = StyleSheet.create({
  
  card: {
    borderRadius: 6,
    elevation: 3,
    backgroundColor: '#fff',
    shadowOffset: { width: 1, height: 1 },
    shadowColor: '#333',
    shadowOpacity: 0.3,
    shadowRadius: 2,
    marginHorizontal: 4,
    marginVertical: 6,
    height: 316,
  },
  leftTextBox: {
    marginHorizontal: 18,
    marginVertical: 20,
    flexDirection: 'column',
    backgroundColor: 'white',
    width: 250,
  },
  date:{
    fontSize: 16,
    color: '#ABABAB',
    fontFamily: 'Poppins',
    fontStyle: 'normal',
    fontWeight: '600',
    position: "relative",
    top: "10.53%",
    bottom: "81.58%",
  },
  name:{
    fontSize: 20,
    fontFamily: 'Poppins',
    fontStyle: 'normal',
    fontWeight: '600',
    position: "relative",
    top: "21.53%",
    bottom: "63.58%",
  },
  circles:{
    flexDirection: 'row',
    // overlay: 10,
    
  },
  circle: {
    borderRadius: Math.round(Dimensions.get('window').width + Dimensions.get('window').height) / 2,
    width: 50,
    height: 50,
    backgroundColor:'#E8E8E8',
    justifyContent: 'center',
    alignItems: 'center',
    position: "relative",
    top: "22%",
    bottom: "36.58%",
  },

  button: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    paddingHorizontal: 32,
    borderRadius: 40,
    elevation: 3,
    width: 157,
    borderColor: 'black',
    borderWidth: 1,  
    backgroundColor: 'white',
  },
  buttonBox:{
    alignItems: 'flex-end',
    position: "relative",
    top: "22%",
    marginRight: 25,
  },
  text: {
    fontSize: 16,
    lineHeight: 21,
    fontWeight: 'bold',
    letterSpacing: 0.25,
    
  // circle: {
  //   width: 100,
  //   height: 100,
  //   borderRadius: 100/2,
  //   backgroundColor: '#F2F2F2',
  // },color: 'black',
  },
});