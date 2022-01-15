import React from 'react'

import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack'

import { Loading, Welcome } from './components'

import EventCard from "./components/EventCard";

import { globalStyles } from './global';

import {
  View, Text, StyleSheet
} from "react-native";

const Stack = createNativeStackNavigator()

export default function App (): JSX.Element {
  return (
    <View>
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name='Welcome' component={Welcome} />
        <Stack.Screen name='Loading' component={Loading} />
      </Stack.Navigator>
    </NavigationContainer>

    <View style={globalStyles.container}>
      <Text >This Month</Text>
      {/* style = {styles.title} */}
      <EventCard>
      </EventCard>
      <EventCard>
      </EventCard>
      </View>

    </View>
  )
}
