// Copyright (c) HashiCorp, Inc.
// SPDX-License-Identifier: BUSL-1.1

package terraform

import (
	"errors"
	"sync/atomic"

	"github.com/zclconf/go-cty/cty"

	"github.com/hashicorp/terraform/internal/addrs"
	"github.com/hashicorp/terraform/internal/plans"
	"github.com/hashicorp/terraform/internal/providers"
	"github.com/hashicorp/terraform/internal/states"
)

// stopHook is a private Hook implementation that Terraform uses to
// signal when to stop or cancel actions.
type stopHook struct {
	stop uint32
}

var _ Hook = (*stopHook)(nil)

func (h *stopHook) PreApply(addr addrs.AbsResourceInstance, dk addrs.DeposedKey, action plans.Action, priorState, plannedNewState cty.Value) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PostApply(addr addrs.AbsResourceInstance, dk addrs.DeposedKey, newState cty.Value, err error) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PreDiff(addr addrs.AbsResourceInstance, dk addrs.DeposedKey, priorState, proposedNewState cty.Value) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PostDiff(addr addrs.AbsResourceInstance, dk addrs.DeposedKey, action plans.Action, priorState, plannedNewState cty.Value) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PreProvisionInstance(addr addrs.AbsResourceInstance, state cty.Value) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PostProvisionInstance(addr addrs.AbsResourceInstance, state cty.Value) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PreProvisionInstanceStep(addr addrs.AbsResourceInstance, typeName string) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PostProvisionInstanceStep(addr addrs.AbsResourceInstance, typeName string, err error) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) ProvisionOutput(addr addrs.AbsResourceInstance, typeName string, line string) {
}

func (h *stopHook) PreRefresh(addr addrs.AbsResourceInstance, dk addrs.DeposedKey, priorState cty.Value) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PostRefresh(addr addrs.AbsResourceInstance, dk addrs.DeposedKey, priorState cty.Value, newState cty.Value) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PreImportState(addr addrs.AbsResourceInstance, importID string) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PostImportState(addr addrs.AbsResourceInstance, imported []providers.ImportedResource) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PrePlanImport(addr addrs.AbsResourceInstance, importID string) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PostPlanImport(addr addrs.AbsResourceInstance, imported []providers.ImportedResource) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PreApplyImport(addr addrs.AbsResourceInstance, importing plans.ImportingSrc) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) PostApplyImport(addr addrs.AbsResourceInstance, importing plans.ImportingSrc) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) Stopping() {}

func (h *stopHook) PostStateUpdate(new *states.State) (HookAction, error) {
	return h.hook()
}

func (h *stopHook) hook() (HookAction, error) {
	if h.Stopped() {
		return HookActionHalt, errors.New("execution halted")
	}

	return HookActionContinue, nil
}

// reset should be called within the lock context
func (h *stopHook) Reset() {
	atomic.StoreUint32(&h.stop, 0)
}

func (h *stopHook) Stop() {
	atomic.StoreUint32(&h.stop, 1)
}

func (h *stopHook) Stopped() bool {
	return atomic.LoadUint32(&h.stop) == 1
}
