/*
 * Mercedes-Benz AG Programming Challenge
 *
 * - Implement the specified REST Endpoint - Protect the API with BasicAuth - Use Docker to run your application - Use one of the following languages&#58; Go, Java, Python, C++ - Automate the infrastructure rollout - Use an external service to determine the city name for depature and destination - Upload your solution to a private GitHub repository - Provide a link to the secured hosted instance of your solution - Provide the following files together with your code&#58;   * Dockerfile   * Build-Script   * Deployment-Script   * Kubernetes deployment YAML (if Kubernetes is used)   * Infrastructure automation scripts   * README.md with documentation how to deploy the infrastructure and the application 
 *
 * API version: 1.0.0
 * Generated by: Swagger Codegen (https://github.com/swagger-api/swagger-codegen.git)
 */

package swagger

type ModelBreak struct {

	StartTimestamp int64 `json:"startTimestamp,omitempty"`

	EndTimestamp int64 `json:"endTimestamp,omitempty"`

	PositionLat float32 `json:"positionLat,omitempty"`

	PositionLong float32 `json:"positionLong,omitempty"`
}
