import org.springframework.security.securechannel.ChannelProcessingFilter
import org.springframework.security.securechannel.ChannelDecisionManagerImpl
import org.springframework.security.securechannel.SecureChannelProcessor
import org.springframework.security.securechannel.InsecureChannelProcessor

beans = {
	secureChannelProcessor(SecureChannelProcessor)
	insecureChannelProcessor(InsecureChannelProcessor)

	channelDecisionManager(ChannelDecisionManagerImpl) {
		channelProcessors = [secureChannelProcessor, insecureChannelProcessor]
	}

	channelProcessingFilter(ChannelProcessingFilter) {
		channelDecisionManager=channelDecisionManager
		filterInvocationDefinitionSource='''
			  CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
			  PATTERN_TYPE_APACHE_ANT
			  /login/**=REQUIRES_SECURE_CHANNEL
                          /logout/**=REQUIRES_INSECURE_CHANNEL
                          /person/**=REQUIRES_SECURE_CHANNEL
                          /=REQUIRES_INSECURE_CHANNEL
		      '''
	}
}