package org.boomslang.testproject.jhipster.features

/** 
 * Generated by: Default feature generator 
 */ 
class NoParamFeature extends org.boomslang.features.BoomslangFeature {

	def "NoParam"() {
	
		given:
			to (org.boomslang.testproject.jhipster.screens.NoParamScreen);
		
		when:
		ok.click()
		and:
		submit.click()
		
	}
	

}
