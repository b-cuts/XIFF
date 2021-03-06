/*
 * Copyright (C) 2003-2012 Igniterealtime Community Contributors
 *
 *     Daniel Henninger
 *     Derrick Grigg <dgrigg@rogers.com>
 *     Juga Paazmaya <olavic@gmail.com>
 *     Nick Velloff <nick.velloff@gmail.com>
 *     Sean Treadway <seant@oncotype.dk>
 *     Sean Voisen <sean@voisen.org>
 *     Mark Walters <mark@yourpalmark.com>
 *     Michael McCarthy <mikeycmccarthy@gmail.com>
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.igniterealtime.xiff.data
{
	import org.flexunit.asserts.assertEquals;
        import org.igniterealtime.xiff.data.*;
        import org.igniterealtime.xiff.data.session.*;
        import org.igniterealtime.xiff.data.disco.*;

        public class ExtensionClassRegistryTest
	{
                [Test( description="Registery getNamespaces" )]
                public function testGetNamespaces():void
                {
                        var testValue:Array = [
                          InfoDiscoExtension.NS,
                          SessionExtension.NS
                        ];

                        ExtensionClassRegistry.register(InfoDiscoExtension);
                        ExtensionClassRegistry.register(SessionExtension);
			
                        assertEquals( testValue.toString(), ExtensionClassRegistry.getNamespaces().toString() );
		}

	}
}
