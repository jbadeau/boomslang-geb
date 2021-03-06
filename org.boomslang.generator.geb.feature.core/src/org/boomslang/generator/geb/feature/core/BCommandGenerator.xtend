package org.boomslang.generator.geb.feature.core

import com.google.inject.Inject
import org.boomslang.dsl.feature.feature.BCommandAction
import org.boomslang.dsl.feature.feature.BCommandComponent
import org.boomslang.dsl.feature.feature.BCommandComponentActionParameter
import org.boomslang.dsl.feature.feature.BTypeAction
import org.boomslang.dsl.feature.services.WidgetTypeRefUtil
import org.boomslang.generator.util.BGeneratorUtil
import org.boomslang.dsl.feature.feature.BClickAction

class BCommandGenerator {
		
	@Inject extension WidgetTypeRefUtil 
	@Inject extension BGeneratorUtil

	// =============================================================================
	// Commands
	// =============================================================================
	def dispatch compile(BCommandComponentActionParameter it) '''
		// TODO
		println "commands of type «it.eClass.name» not yet implemented"
	'''
	
	// =============================================================================
	// Command Componens
	// =============================================================================
	def dispatch compile(BCommandComponent it)'''
	«it.action.compileAction»'''	
	
	// =============================================================================
	// Actions
	// =============================================================================
	def dispatch compileAction(BCommandAction it)'''
	// TODO
	println "command actions of type «it.eClass.name» not yet implemented in compileAction"
	'''
	
	def dispatch compileAction(BTypeAction it)'''
	«it.widgetBeforeOffset.name.toFirstLower».value «it.compileActionPlaceholder»'''
	
	def dispatch compileAction(BClickAction it)'''
	«it.widgetBeforeOffset.name.toFirstLower».click(«compileActionPlaceholder»)'''
	
	// =============================================================================
	// Action Parameter
	// =============================================================================
	def dispatch compileActionParameter(BCommandAction it)'''
	// TODO
	println "command actions of type «it.eClass.name» not yet implemented in compileActionParameter"
	'''
	def dispatch compileActionParameter(BTypeAction it)'''
		«it.value.compileStringOrParam»'''
	
	def dispatch compileActionParameter(BClickAction it)'''
	«it.BTileParameter?.BPropertyAssertionAction?.value?.compileIntOrStringOrParam»'''
	
	// =============================================================================
	// Action Placeholder
	// =============================================================================
	
	def dispatch compileActionPlaceholder(BCommandAction it)'''
	// TODO
	println "command actions of type «it.eClass.name» not yet implemented in compileActionPlaceholder"
	'''
	
	def dispatch compileActionPlaceholder(BTypeAction it)'''
	$«it.widgetBeforeOffset.name.toFirstLower»'''
	
	def dispatch compileActionPlaceholder(BClickAction it)
	'''«it.placeholderName»'''
	
	//Method introduced to keep the template a little bit cleaner
	def getPlaceholderName(BClickAction it){
		 if(it.BTileParameter?.BAssertionComponent!=null){
		 	'$'+it.BTileParameter?.BAssertionComponent.widget.widget.name.toFirstLower
		 }else if(it.BTileParameter?.BPropertyAssertionAction!=null){
		 	'$'+it.BTileParameter?.BPropertyAssertionAction.propertyName.toFirstLower
		}else if (it.BTileParameter?.BBooleanAssertionAction!=null){
			'$'+it.BTileParameter.BBooleanAssertionAction.booleanPropertyName.toFirstLower
		}
	}
}