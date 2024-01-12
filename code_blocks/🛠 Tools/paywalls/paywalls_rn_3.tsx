import React from 'react';
import RevenueCatUI from 'react-native-purchases-ui';

import { Text } from 'react-native';
import { NativeStackScreenProps } from '@react-navigation/native-stack';
import RootStackParamList from '../RootStackParamList';

type Props = NativeStackScreenProps<RootStackParamList, 'FooterPaywall'>;

const FooterPaywallScreen: React.FC<Props> = () => {
    return (
        <RevenueCatUI.PaywallFooterContainerView style={{ backgroundColor: '#f8f8f8' }}>
            <Text>
                Your Custom Paywall Design
            </Text>
        </RevenueCatUI.PaywallFooterContainerView>
    );
};