// Copyright (c) 2016, 2018, 2025, Oracle and/or its affiliates.  All rights reserved.
// This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.
// Code generated. DO NOT EDIT.

// Core Services API
//
// Use the Core Services API to manage resources such as virtual cloud networks (VCNs),
// compute instances, and block storage volumes. For more information, see the console
// documentation for the Networking (https://docs.oracle.com/iaas/Content/Network/Concepts/overview.htm),
// Compute (https://docs.oracle.com/iaas/Content/Compute/Concepts/computeoverview.htm), and
// Block Volume (https://docs.oracle.com/iaas/Content/Block/Concepts/overview.htm) services.
// The required permissions are documented in the
// Details for the Core Services (https://docs.oracle.com/iaas/Content/Identity/Reference/corepolicyreference.htm) article.
//

package core

import (
	"fmt"
	"k8s.io/autoscaler/cluster-autoscaler/cloudprovider/oci/vendor-internal/github.com/oracle/oci-go-sdk/v65/common"
	"strings"
)

// ClusterNetworkSummary Summary information for a cluster network with instance pools (https://docs.oracle.com/iaas/Content/Compute/Tasks/managingclusternetworks.htm).
type ClusterNetworkSummary struct {

	// The OCID (https://docs.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cluster network.
	Id *string `mandatory:"true" json:"id"`

	// The OCID (https://docs.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the
	// cluster netowrk.
	CompartmentId *string `mandatory:"true" json:"compartmentId"`

	// The current state of the cluster network.
	LifecycleState ClusterNetworkSummaryLifecycleStateEnum `mandatory:"true" json:"lifecycleState"`

	// The date and time the resource was created, in the format defined by RFC3339 (https://tools.ietf.org/html/rfc3339).
	// Example: `2016-08-25T21:10:29.600Z`
	TimeCreated *common.SDKTime `mandatory:"true" json:"timeCreated"`

	// The date and time the resource was updated, in the format defined by RFC3339 (https://tools.ietf.org/html/rfc3339).
	// Example: `2016-08-25T21:10:29.600Z`
	TimeUpdated *common.SDKTime `mandatory:"true" json:"timeUpdated"`

	// Defined tags for this resource. Each key is predefined and scoped to a
	// namespace. For more information, see Resource Tags (https://docs.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
	// Example: `{"Operations": {"CostCenter": "42"}}`
	DefinedTags map[string]map[string]interface{} `mandatory:"false" json:"definedTags"`

	// A user-friendly name. Does not have to be unique, and it's changeable.
	// Avoid entering confidential information.
	DisplayName *string `mandatory:"false" json:"displayName"`

	// Free-form tags for this resource. Each tag is a simple key-value pair with no
	// predefined name, type, or namespace. For more information, see Resource Tags (https://docs.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
	// Example: `{"Department": "Finance"}`
	FreeformTags map[string]string `mandatory:"false" json:"freeformTags"`

	// The instance pools in the cluster network.
	InstancePools []InstancePoolSummary `mandatory:"false" json:"instancePools"`
}

func (m ClusterNetworkSummary) String() string {
	return common.PointerString(m)
}

// ValidateEnumValue returns an error when providing an unsupported enum value
// This function is being called during constructing API request process
// Not recommended for calling this function directly
func (m ClusterNetworkSummary) ValidateEnumValue() (bool, error) {
	errMessage := []string{}
	if _, ok := GetMappingClusterNetworkSummaryLifecycleStateEnum(string(m.LifecycleState)); !ok && m.LifecycleState != "" {
		errMessage = append(errMessage, fmt.Sprintf("unsupported enum value for LifecycleState: %s. Supported values are: %s.", m.LifecycleState, strings.Join(GetClusterNetworkSummaryLifecycleStateEnumStringValues(), ",")))
	}

	if len(errMessage) > 0 {
		return true, fmt.Errorf(strings.Join(errMessage, "\n"))
	}
	return false, nil
}

// ClusterNetworkSummaryLifecycleStateEnum Enum with underlying type: string
type ClusterNetworkSummaryLifecycleStateEnum string

// Set of constants representing the allowable values for ClusterNetworkSummaryLifecycleStateEnum
const (
	ClusterNetworkSummaryLifecycleStateProvisioning ClusterNetworkSummaryLifecycleStateEnum = "PROVISIONING"
	ClusterNetworkSummaryLifecycleStateScaling      ClusterNetworkSummaryLifecycleStateEnum = "SCALING"
	ClusterNetworkSummaryLifecycleStateStarting     ClusterNetworkSummaryLifecycleStateEnum = "STARTING"
	ClusterNetworkSummaryLifecycleStateStopping     ClusterNetworkSummaryLifecycleStateEnum = "STOPPING"
	ClusterNetworkSummaryLifecycleStateTerminating  ClusterNetworkSummaryLifecycleStateEnum = "TERMINATING"
	ClusterNetworkSummaryLifecycleStateStopped      ClusterNetworkSummaryLifecycleStateEnum = "STOPPED"
	ClusterNetworkSummaryLifecycleStateTerminated   ClusterNetworkSummaryLifecycleStateEnum = "TERMINATED"
	ClusterNetworkSummaryLifecycleStateRunning      ClusterNetworkSummaryLifecycleStateEnum = "RUNNING"
)

var mappingClusterNetworkSummaryLifecycleStateEnum = map[string]ClusterNetworkSummaryLifecycleStateEnum{
	"PROVISIONING": ClusterNetworkSummaryLifecycleStateProvisioning,
	"SCALING":      ClusterNetworkSummaryLifecycleStateScaling,
	"STARTING":     ClusterNetworkSummaryLifecycleStateStarting,
	"STOPPING":     ClusterNetworkSummaryLifecycleStateStopping,
	"TERMINATING":  ClusterNetworkSummaryLifecycleStateTerminating,
	"STOPPED":      ClusterNetworkSummaryLifecycleStateStopped,
	"TERMINATED":   ClusterNetworkSummaryLifecycleStateTerminated,
	"RUNNING":      ClusterNetworkSummaryLifecycleStateRunning,
}

var mappingClusterNetworkSummaryLifecycleStateEnumLowerCase = map[string]ClusterNetworkSummaryLifecycleStateEnum{
	"provisioning": ClusterNetworkSummaryLifecycleStateProvisioning,
	"scaling":      ClusterNetworkSummaryLifecycleStateScaling,
	"starting":     ClusterNetworkSummaryLifecycleStateStarting,
	"stopping":     ClusterNetworkSummaryLifecycleStateStopping,
	"terminating":  ClusterNetworkSummaryLifecycleStateTerminating,
	"stopped":      ClusterNetworkSummaryLifecycleStateStopped,
	"terminated":   ClusterNetworkSummaryLifecycleStateTerminated,
	"running":      ClusterNetworkSummaryLifecycleStateRunning,
}

// GetClusterNetworkSummaryLifecycleStateEnumValues Enumerates the set of values for ClusterNetworkSummaryLifecycleStateEnum
func GetClusterNetworkSummaryLifecycleStateEnumValues() []ClusterNetworkSummaryLifecycleStateEnum {
	values := make([]ClusterNetworkSummaryLifecycleStateEnum, 0)
	for _, v := range mappingClusterNetworkSummaryLifecycleStateEnum {
		values = append(values, v)
	}
	return values
}

// GetClusterNetworkSummaryLifecycleStateEnumStringValues Enumerates the set of values in String for ClusterNetworkSummaryLifecycleStateEnum
func GetClusterNetworkSummaryLifecycleStateEnumStringValues() []string {
	return []string{
		"PROVISIONING",
		"SCALING",
		"STARTING",
		"STOPPING",
		"TERMINATING",
		"STOPPED",
		"TERMINATED",
		"RUNNING",
	}
}

// GetMappingClusterNetworkSummaryLifecycleStateEnum performs case Insensitive comparison on enum value and return the desired enum
func GetMappingClusterNetworkSummaryLifecycleStateEnum(val string) (ClusterNetworkSummaryLifecycleStateEnum, bool) {
	enum, ok := mappingClusterNetworkSummaryLifecycleStateEnumLowerCase[strings.ToLower(val)]
	return enum, ok
}
